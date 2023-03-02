from django.shortcuts import render, HttpResponse
from quality_change_management.models import TargetMaster, PageMaster, ActionMaster,\
    StepMaster, StepPageEntryMaster, StepDisplayPage, StepChargeDepartment, StepRelation, StepAction,\
    Log, Request, Quality, Safety, Progress
from fms.models import User, DepartmentMaster, DivisionMaster, UserAttribute
import openpyxl


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
        'message': 'データを削除しました'
    }

    return render(request, 'app/app.html', data)


def excel_import(request):

    # import用EXCELファイルの読み込み
    file_path = 'C:\\Users\\y-kawauchi\\python_tool_development\\sqlite_test\\app\\データ移行.xlsx'
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
        'output': TargetMaster.objects.all,
        'output2': StepMaster.objects.all,
        'message': 'importしました'
    }

    # return HttpResponse("<script>alert('importしました');window.history.back(-1);</script>")
    return render(request, 'app/app.html', data)


def excel_import2(request):

    # import用EXCELファイルの読み込み
    file_path = 'C:\\Users\\y-kawauchi\\python_tool_development\\sqlite_test\\app\\データ移行2.xlsx'
    book = openpyxl.load_workbook(file_path)

    # ①シート名を取得
    for sheet in book.sheetnames:
        # print('シート名:' + sheet)  # シート名確認

        # ③データを取得
        if sheet == 'User':
            for column_data in book[sheet].iter_rows(min_row=2):

                # ④1行ずつINSERT
                globals()[sheet].objects.create(
                    username=column_data[0].value,
                    first_name=column_data[1].value,
                    last_name=column_data[2].value,
                    display_order=column_data[3].value,
                    lost_flag=column_data[4].value
                )

        # ③データを取得
        if sheet == 'DepartmentMaster':
            for column_data in book[sheet].iter_rows(min_row=2):

                aria_manager = None
                if column_data[3].value is not None:
                    aria_manager = User.objects.get(username=column_data[3].value)

                # ④1行ずつINSERT
                globals()[sheet].objects.create(
                    department_cd=column_data[0].value,
                    department_name=column_data[1].value,
                    division_cd=column_data[2].value,
                    area_manager=aria_manager,
                    jurisdiction_area=column_data[4].value,
                    display_order=column_data[5].value,
                    lost_flag=column_data[6].value
                )

        # ③データを取得
        if sheet == 'DivisionMaster':
            for column_data in book[sheet].iter_rows(min_row=2):

                # ④1行ずつINSERT
                globals()[sheet].objects.create(
                    division_cd=column_data[0].value,
                    division_name=column_data[1].value,
                    display_order=column_data[2].value,
                    lost_flag=column_data[3].value
                )

        # ③データを取得
        if sheet == 'UserAttribute':
            for column_data in book[sheet].iter_rows(min_row=2):

                # ④1行ずつINSERT
                globals()[sheet].objects.create(
                    username=column_data[1].value,
                    department=column_data[2].value,
                    division=column_data[3].value,
                    authority=column_data[4].value,
                    confirm_username=column_data[5].value,
                    permit_username=column_data[6].value,
                    department_charge_flag=column_data[7].value,
                    display_order=column_data[8].value,
                    user_order=column_data[9].value,
                    lost_flag=column_data[10].value
                )

    data = {
        'message': 'import2しました'
    }

    return render(request, 'app/app.html', data)
