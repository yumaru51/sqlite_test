from quality_change_management.models import StepChargeDepartment, Request
from fms.models import DepartmentMaster, UserAttribute


# 担当部署制御　原課部署(Original)対応のため、部署コードリストを再取得する共通関数
def department_lists(request, step=''):
    request_id = request.session['request_id']
    target = request.session['target']
    step_department_list = []

    for step_charge_department_list in StepChargeDepartment.objects.filter(step_id=step, target=target, lost_flag=0):

        if step_charge_department_list.charge_department == 'Original':     # 申請部署

            if request_id == 0 or request_id is None:       # 新規申請のとき
                step_department_list.append(UserAttribute.objects.filter(username=request.user, lost_flag=0).first().department)

            else:                                           # 既存申請のとき
                division_cd = DepartmentMaster.objects.get(department_cd=Request.objects.get(id=request_id).department).division_cd
                for department_master_list in DepartmentMaster.objects.filter(division_cd=division_cd):
                    step_department_list.append(department_master_list.department_cd)

        else:                                                               # 所管部署
            step_department_list.append(step_charge_department_list.charge_department)

    return step_department_list

