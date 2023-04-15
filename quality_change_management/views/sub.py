from quality_change_management.models import StepChargeDepartment, Request
from fms.models import UserAttribute


# 担当部署制御　原課部署(Original)対応のため、部署コードリストを再取得する共通関数
def department_lists(request, step=''):
    request_id = request.session['request_id']
    target = request.session['target']

    # department_cdを配列にいれて、'Original'だったら置き換える。
    department_cd_lists = []
    for step_charge_department_list in StepChargeDepartment.objects.filter(step_id=step, target=target, lost_flag=0):
        if step_charge_department_list.charge_department == 'Original':
            if request_id == 0 or request_id is None:       # 新規のとき
                department_cd_lists.append(UserAttribute.objects.filter(username=request.user).first().department)
            else:                                           # 既存のとき
                department_cd_lists.append(Request.objects.get(id=request_id).department)
        else:
            department_cd_lists.append(step_charge_department_list.charge_department)

    return department_cd_lists

