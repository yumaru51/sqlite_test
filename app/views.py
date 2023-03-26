from django.shortcuts import render, HttpResponse
from django.apps import apps  # app情報を取得
from django.db.models import Model  # Model情報を取得
from quality_change_management.models import TargetMaster, PageMaster, ActionMaster,\
    StepMaster, StepPageEntryMaster, StepDisplayPage, StepChargeDepartment, StepRelation, StepAction,\
    Log, Request, Quality, Safety, Progress
from fms.models import User, DepartmentMaster, DivisionMaster, UserAttribute
from pathlib import Path
from datetime import date
import openpyxl
from openpyxl.utils import datetime
import xlwt
import xlrd
import os
import pandas as pd


def get_excluded_app_list():
    excluded_apps = [
        'django.contrib.admin',
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.messages',
        'django.contrib.staticfiles']
    app_configs = [app_config for app_config in apps.get_app_configs() if app_config.name not in excluded_apps]
    return app_configs


def output_test(request):

    # db_routerがどこを通っているか確認。名前が同じだと後の設定に上書きされる。
    # from django.db import router
    # from fms.models import User
    # print(router.db_for_read(User))
    # print(router.db_for_write(User))
    #
    # from django.contrib.auth.models import User
    # print(router.db_for_read(User))
    # print(router.db_for_write(User))

    data = {
        'app_list': get_excluded_app_list(),
        'output': TargetMaster.objects.all,
        'output2': StepMaster.objects.all,
        'message': 'データを出力しました'
    }

    return render(request, 'app/app.html', data)


def delete_test(request):

    # 外部参照のため、DELETEの順番に注意
    StepAction.objects.all().delete()
    StepRelation.objects.all().delete()
    StepChargeDepartment.objects.all().delete()
    StepDisplayPage.objects.all().delete()
    StepPageEntryMaster.objects.all().delete()
    StepMaster.objects.all().delete()
    ActionMaster.objects.all().delete()
    PageMaster.objects.all().delete()
    TargetMaster.objects.all().delete()

    UserAttribute.objects.all().delete()
    DivisionMaster.objects.all().delete()
    DepartmentMaster.objects.all().delete()
    User.objects.all().delete()

    data = {
        'app_list': get_excluded_app_list(),
        'message': 'データを削除しました'
    }

    return render(request, 'app/app.html', data)


def excel_import(request):

    # import用EXCELファイルの読み込み
    # file_path = 'C:\\Users\\y-kawauchi\\python_tool_development\\sqlite_test\\app\\データ移行.xlsx'
    file_path = '/Users/kawauchiyuuki/PycharmProjects/sqlite_test/app/データ移行.xlsx'

    book = openpyxl.load_workbook(file_path)

    # ①シート名を取得
    for sheet in book.sheetnames:
        # print('シート名:' + sheet)  # シート名確認

        # ②列名を取得
        # book['シート名'] シート名指定して取得, book['シート名'][X行] 行指定して取得
        # book.worksheets[0] 先頭のシート
        # for header in book[sheet][1]:
        #     if header.value is not None:
        #         print('列名:' + header.value)  # 列名確認

        # ③データを取得
        if sheet == 'TargetMaster':
            for column_data in book[sheet].iter_rows(min_row=2):

                # ④1行ずつINSERT
                globals()[sheet].objects.create(
                    target=column_data[0].value,
                    target_name=column_data[1].value,
                    lost_flag=column_data[2].value
                )

        # ③データを取得
        if sheet == 'PageMaster':
            for column_data in book[sheet].iter_rows(min_row=2):

                # ④1行ずつINSERT
                globals()[sheet].objects.create(
                    page=column_data[0].value,
                    page_name=column_data[1].value,
                    lost_flag=column_data[2].value
                )

        # ③データを取得
        if sheet == 'ActionMaster':
            for column_data in book[sheet].iter_rows(min_row=2):

                # ④1行ずつINSERT
                globals()[sheet].objects.create(
                    action=column_data[0].value,
                    action_name=column_data[1].value,
                    action_class=column_data[2].value,
                    action_authority=column_data[3].value,
                    progress_transition=column_data[4].value,
                    lost_flag=column_data[5].value
                )

        # ③データを取得
        if sheet == 'StepMaster':
            for column_data in book[sheet].iter_rows(min_row=2):

                # ④1行ずつINSERT
                globals()[sheet].objects.create(
                    step=column_data[0].value,
                    step_name=column_data[1].value,
                    lost_flag=column_data[2].value,
                    hidden_flag=column_data[3].value
                )

        # ③データを取得
        if sheet == 'StepPageEntryMaster':
            for column_data in book[sheet].iter_rows(min_row=2):

                # ④1行ずつINSERT
                globals()[sheet].objects.create(
                    step=StepMaster.objects.get(step=column_data[1].value),
                    page=PageMaster.objects.get(page=column_data[2].value),
                    target=TargetMaster.objects.get(target=column_data[3].value),
                    lost_flag=column_data[4].value
                )

        # ③データを取得
        if sheet == 'StepDisplayPage':
            for column_data in book[sheet].iter_rows(min_row=2):

                # ④1行ずつINSERT
                globals()[sheet].objects.create(
                    step=StepMaster.objects.get(step=column_data[1].value),
                    page_no=column_data[2].value,
                    page=PageMaster.objects.get(page=column_data[3].value),
                    default_page=column_data[4].value,
                    lost_flag=column_data[5].value
                )

        # ③データを取得
        if sheet == 'StepChargeDepartment':
            for column_data in book[sheet].iter_rows(min_row=2):

                # ④1行ずつINSERT
                globals()[sheet].objects.create(
                    step=StepMaster.objects.get(step=column_data[1].value),
                    target=TargetMaster.objects.get(target=column_data[2].value),
                    charge_department=column_data[3].value,
                    display_order=column_data[4].value,
                    lost_flag=column_data[5].value
                )

        # ③データを取得
        if sheet == 'StepRelation':
            for column_data in book[sheet].iter_rows(min_row=2):

                # ④1行ずつINSERT
                globals()[sheet].objects.create(
                    present_step=StepMaster.objects.get(step=column_data[1].value),
                    next_step=StepMaster.objects.get(step=column_data[2].value),
                    type=column_data[3].value,
                    display_order=column_data[4].value,
                    lost_flag=column_data[5].value
                )

        # ③データを取得
        if sheet == 'StepAction':
            for column_data in book[sheet].iter_rows(min_row=2):

                # ④1行ずつINSERT
                globals()[sheet].objects.create(
                    step=StepMaster.objects.get(step=column_data[1].value),
                    action_class=column_data[2].value,
                    action=ActionMaster.objects.get(action=column_data[3].value),
                    display_order=column_data[4].value,
                    lost_flag=column_data[5].value
                )

                # 1セルずつ取りたいならforで回す。行データ取得して全列
                # for row in column_data:
                # print(row.value)

                # 1セルずつ取りたいならforで回す。列数取得してindex指定
                # for index in range(len(column_data)):
                #     print(column_data[index].value)

    data = {
        'app_list': get_excluded_app_list(),
        'output': TargetMaster.objects.all,
        'output2': StepMaster.objects.all,
        'message': '変更管理のデータをimportしました'
    }

    # return HttpResponse("<script>alert('importしました');window.history.back(-1);</script>")
    return render(request, 'app/app.html', data)


def import_excel_to_model(model: Model, file_name, output_folder_path):
    print(file_name + 'を処理しています')
    fields = model._meta.fields
    kwargs = {}

    # Excelファイル読込
    workbook = openpyxl.load_workbook(output_folder_path + '/' + file_name + '.xlsx')
    worksheet = workbook.active

    # 項目の取得
    column_names = []
    for cell in worksheet[1]:
        column_names.append(cell.value)

    # データの取得
    for column_data in worksheet.iter_rows(min_row=2):
        for i in range(len(column_names)):
            # print('項目名：' + column_names[i] + '値：' + column_data[i].value)

            # 外部参照キーの場合、参照元テーブルのインスタンスを格納
            if fields[i].get_internal_type() == 'ForeignKey':
                try:
                    # 参照元テーブルのインスタンス取得
                    if column_data[i].value is not None:
                        ref_pk = column_data[i].value
                        ref_model = fields[i].remote_field.model
                        ref_instance = ref_model.objects.get(pk=ref_pk)
                        kwargs[column_names[i]] = ref_instance
                    else:
                        kwargs[column_names[i]] = None
                except ValueError:
                    continue
            else:
                kwargs[column_names[i]] = column_data[i].value

        # 1行ずつIMPORT処理
        # globals()[file_name].objects.create(**{column_names[i]: column_data[i].value})  # 辞書に変換する構文
        # kwargs = dict(zip(column_names, column_datas))
        print(kwargs)
        globals()[file_name].objects.create(**kwargs)

    return


def import_data(request):
    today = str(date.today())
    app_name = request.POST['app_name']
    output_folder_path = '/Users/kawauchiyuuki/PycharmProjects/sqlite_test/' + today + '_' + app_name
    # output_folder_path = 'C:/Users/y-kawauchi/python_tool_development/sqlite_test/' + today + '_' + app_name

    # フォルダを作成する
    Path(output_folder_path).mkdir(parents=True, exist_ok=True)

    # ファイルが1件もない
    if request.FILES.__len__() == 0:
        breakpoint

    # import用EXCELファイルの読み込み
    else:
        for file in request.FILES.getlist('import_file'):
            # ファイル名をファイル名部分と拡張子部分で分ける
            file_name, ext = os.path.splitext(file.name)
            # 「.xls」形式でExcelファイルを開く
            df = pd.read_excel(file, engine='xlrd')
            # 「.xlsx」形式でExcelファイルを保存する
            df.to_excel(output_folder_path + '/' + file_name + '.xlsx', index=False)
            # ModelClass指定でModel情報取得
            model_data = apps.get_model(app_name, file_name)  # "app_name.ModelName"
            import_excel_to_model(model_data, file_name, output_folder_path)

    print('import完了')

    data = {
        'app_list': get_excluded_app_list(),
        'message': 'データをimportしました'
    }

    return render(request, 'app/app.html', data)


# 外部参照キー対応
def export_model_to_excel(model: Model, output_file_path: str):
    # get all fields
    fields = model._meta.fields

    # create workbook and worksheet
    workbook = xlwt.Workbook(encoding='utf-8')
    worksheet = workbook.add_sheet(model.__name__)

    # write headers
    for i, field in enumerate(fields):
        worksheet.write(0, i, field.name)

    # write data
    row = 1
    for obj in model.objects.all():
        col = 0
        for field in fields:
            if field.get_internal_type() == 'ForeignKey':
                # check if foreign key value can be converted to
                try:
                    # 参照先テーブルの外部参照キー項目
                    foreignkey_field = getattr(obj, field.name)

                    # 参照元テーブルの主キー取得
                    if foreignkey_field is not None:
                        # ①参照元テーブルの主キー値取得
                        foreignkey_value = foreignkey_field.pk
                        # ②参照元テーブルの主キーを取得してから値を取得
                        # pk_name = foreignkey_field._meta.pk.name  # たぶん参照元テーブルとかも取れる？
                        # foreignkey_value = foreignkey_field.__getattribute__(pk_name)  # 動的にするやつ
                    else:
                        foreignkey_value = ''

                except ValueError:
                    continue
                # write the foreign key value to the worksheet
                worksheet.write(row, col, foreignkey_value)
            elif field.get_internal_type() == 'DateTimeField':
                try:
                    # datetime_value = getattr(obj, field.name).replace(tzinfo=None)
                    datetime_value = datetime.datetime.strftime(getattr(obj, field.name).replace(tzinfo=None), '%Y-%m-%d')
                except ValueError:
                    continue
                # write the datetime key value to the worksheet
                worksheet.write(row, col, datetime_value)
            else:
                # write the field value to the worksheet
                worksheet.write(row, col, getattr(obj, field.name))
            col += 1
        row += 1

    # save workbook to output file path
    workbook.save(output_file_path)


# Model名を指定して、Excelファイルに出力する
def export_data(request):
    today = str(date.today())
    app_name = request.POST['app_name']
    output_folder_path = '/Users/kawauchiyuuki/PycharmProjects/sqlite_test/' + today + '_' + app_name
    # output_folder_path = 'C:/Users/y-kawauchi/python_tool_development/sqlite_test/' + today + '_' + app_name

    # フォルダを作成する
    Path(output_folder_path).mkdir(parents=True, exist_ok=True)

    # ModelClass指定でModel情報取得
    # model_data = apps.get_model("app_name.ModelName")  # "app_name.ModelName"
    # プロジェクトの全Model情報取得
    # model_list = apps.get_models()
    # アプリ毎のModel情報取得
    app = apps.get_app_config(app_name)  # アプリケーション名で指定したアプリケーションオブジェクトを取得
    model_list = app.get_models()  # アプリケーション内の全モデルを取得

    # モデル名のリストを取得、export
    for model in model_list:
        print('App名：' + str(app) + ', Model名：' + model.__name__)
        model_data = app.get_model(model.__name__)  # "app_name.ModelName"
        output_file_path = output_folder_path + '/' + model.__name__ + ".xls"
        export_model_to_excel(model_data, output_file_path)

    data = {
        'app_list': get_excluded_app_list(),
        'app_name': app_name,
        'message': app_name + 'をexportしました'
    }

    return render(request, 'app/app.html', data)


def test_function(request):

    kwargs = {
        'id': 1,
        'division': 'TIODIV',
        'department': 'S',
        'user': 'end',
        'change_target': '[method, facility, ]',
        'others': None,
        'title': '1B2BC工場\u3000H-N廃酸運用方法の変更',
        'outline': '①\t1次洗浄濾液をタイマー管理でH・N廃酸に振り分けていったが、H-N廃酸の切替をなくし全量N廃酸とする。\n②\tW-10タンクとW-04タンクを底配管で連通させて、加水分解タンクの希釈水タンクの容量を20→40m3としオーバーフローとしてN廃酸へロスしていたものを削減する。',
        'level': None,
        'treatment': None,
        'safety_aspect': '0',
        'quality_aspect': '0',
        'delivery_date': 42552,
        # 'delivery_date_start': None,
        'delivery_date_end': None,
        'level2': '継続',
        'others2': None,
        'completion_date': None,
        'application_date': None,
        'education_management_system_id': None
    }
    Request.objects.create(**kwargs)

    data = {
        'app_list': get_excluded_app_list(),
        'message': 'テスト完了'
    }

    return render(request, 'app/app.html', data)


# 外部参照キー未対応(削除予定)
def export_model_to_excel2(model: Model, output_file_path: str):
    # Excelファイルを作成
    workbook = openpyxl.Workbook()
    worksheet = workbook.active
    # ヘッダ行を追加
    headers = [field.name for field in model._meta.fields]
    worksheet.append(headers)
    # データ行を追加
    for obj in model.objects.all():
        row = [getattr(obj, field) for field in headers]
        worksheet.append(row)
    # Excelファイルを保存
    workbook.save(output_file_path)
