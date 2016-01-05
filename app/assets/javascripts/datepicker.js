// http://eonasdan.github.io/bootstrap-datetimepicker
// http://brandonhilkert.com/blog/page-specific-javascript-in-rails/

$("cars.edit").ready(function () {
  $(function () {
    $('#datetimepicker_start').datetimepicker({format: 'DD/MM/YYYY'});
    $('#datetimepicker_end').datetimepicker({
      format: 'DD/MM/YYYY',
      useCurrent: false //Important! See issue #1075
    });
    $("#datetimepicker_start").on("dp.change", function (e) {
      $('#datetimepicker_end').data("DateTimePicker").minDate(e.date);
    });
    $("#datetimepicker_end").on("dp.change", function (e) {
      $('#datetimepicker_start').data("DateTimePicker").maxDate(e.date);
    });
  });
});