$("#errorMessage").html("")
dateTo = new Date($("#picker_date").val())
dateFrom = new Date($("#date_picker").val())

if dateTo >= dateFrom

  queryStr = "created_at BETWEEN '" + dateFrom.getFullYear() + "-" + (dateFrom.getMonth() + 1) + "-" + dateFrom.getDate() + " 00:00:00' AND '" + dateTo.getFullYear() + "-" + (dateTo.getMonth() + 1) + "-" + dateTo.getDate() + " 23:59:59'"
