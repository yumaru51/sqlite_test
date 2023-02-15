from django.shortcuts import render
from .models import TargetMaster


def output_test(request):

    data = {
        'output': TargetMaster.objects.all,
    }

    return render(request, 'app/output.html', data)


def input_test(request):

    TargetMaster.objects.create(
        target='request',
        target_name='依頼データ',
        lost_flag=0
    )
    TargetMaster.objects.create(
        target='quality',
        target_name='品質データ',
        lost_flag=0
    )
    TargetMaster.objects.create(
        target='safety',
        target_name='安全データ',
        lost_flag=0
    )

    return render(request, 'app/input.html')


def delete_test(request):

    TargetMaster.objects.all().delete()

    return render(request, 'app/delete.html')
