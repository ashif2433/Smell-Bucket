
$(function () {
    "use strict";

    $(document).ready(function () {
        $('#example').DataTable();
    });

    $(document).ready(function () {
        var table = $('#example2').DataTable({
            lengthChange: true,
            buttons: ['copy', 'excel', 'pdf', 'print']
        });

        table.buttons().container()
            .appendTo('#example2_wrapper .col-md-6:eq(0)')
            .addClass('mt-2');

        $('#example2 tbody').on('click', '.print-btn', function () {
            var orderId = $(this).data('order-id');
            var row = $(this).closest('tr');
            var rowContent = row.html();

            var printWindow = window.open('', '', 'height=600,width=800');
            printWindow.document.write('<html><head><title>Print Product</title>');
            printWindow.document.write('</head><body>');
            printWindow.document.write('<table border="1">' + rowContent + '</table>');
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            printWindow.focus();
            printWindow.print();
            printWindow.close();
        });
    });
});
