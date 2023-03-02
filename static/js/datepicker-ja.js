$('.datepicker').datepicker();

jQuery(function($){
    $.datepicker.regional['ja'] = {
        closeText: '����',
        prevText: '<�O',
        nextText: '��>',
        currentText: '����',
        monthNames: ['1��','2��','3��','4��','5��','6��',
        '7��','8��','9��','10��','11��','12��'],
        monthNamesShort: ['1��','2��','3��','4��','5��','6��',
        '7��','8��','9��','10��','11��','12��'],
        dayNames: ['���j��','���j��','�Ηj��','���j��','�ؗj��','���j��','�y�j��'],
        dayNamesShort: ['��','��','��','��','��','��','�y'],
        dayNamesMin: ['��','��','��','��','��','��','�y'],
        weekHeader: '�T',
        dateFormat: 'yy�Nm��d��',
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: '�N'};
    $.datepicker.setDefaults($.datepicker.regional['ja']);
});