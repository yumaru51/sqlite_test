from django.shortcuts import render, HttpResponse
from .models import TargetMaster2
from quality_change_management.models import StepMaster
import openpyxl


def output_test(request):

    # db_routerがどこを通っているか確認。名前が同じだと後の設定に上書きされる。
    from django.db import router
    from fms.models import User
    print(router.db_for_read(User))
    print(router.db_for_write(User))

    from django.contrib.auth.models import User
    print(router.db_for_read(User))
    print(router.db_for_write(User))

    data = {
        'output': TargetMaster2.objects.all,
        'output2': StepMaster.objects.all,
        'message': 'データを出力しました'
    }

    return render(request, 'app/app.html', data)


def input_test(request):

    TargetMaster2.objects.create(
        target='request',
        target_name='依頼データ',
        lost_flag=0
    )
    TargetMaster2.objects.create(
        target='quality',
        target_name='品質データ',
        lost_flag=0
    )
    TargetMaster2.objects.create(
        target='safety',
        target_name='安全データ',
        lost_flag=0
    )
    StepMaster.objects.create(
        step=1102,
        step_name='原課登録編集',
        lost_flag=0,
        hidden_flag=0
    )

    data = {
        'message': 'データを登録しました'
    }

    return render(request, 'app/app.html', data)


def delete_test(request):

    TargetMaster2.objects.all().delete()
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
    # book[sheet] シートを指定して取得
    # book.worksheets[0] 先頭のシート
    for sheet in book.sheetnames:
        print('シート名:' + sheet)

        # ②ヘッダーを取得
        # book[sheet][X行] 行指定でカーソル
        # cell.value 値を取得
        for column_name in book[sheet][1]:
            if column_name.value is not None:
                print('列名:' + column_name.value)

        # ③データを取得
        for row in book[sheet].iter_rows(min_row=2):
            for cell in row:
                print(cell.value)

        # if sheet == 'StepMaster':
        #     # globals()[変数]
        #     globals()[sheet].objects.create(
        #         step=1104,
        #         step_name='原課部長承認',
        #         lost_flag=0,
        #         hidden_flag=0
        #     )

    data = {
        'output': TargetMaster2.objects.all,
        'output2': StepMaster.objects.all,
        'message': 'importしました'
    }

    # return HttpResponse("<script>alert('importしました');window.history.back(-1);</script>")
    return render(request, 'app/app.html', data)
