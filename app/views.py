from django.shortcuts import render, HttpResponse
from quality_change_management.models import TargetMaster, StepMaster
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

    TargetMaster.objects.all().delete()
    StepMaster.objects.all().delete()

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
        if sheet == 'StepMaster':
            for column_data in book[sheet].iter_rows(min_row=2):

                # ④1行ずつINSERT
                globals()[sheet].objects.create(
                    step=column_data[0].value,
                    step_name=column_data[1].value,
                    lost_flag=column_data[2].value,
                    hidden_flag=column_data[3].value
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
