from django.shortcuts import render
from .models import TargetMaster2
from quality_change_management.models import StepMaster


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
