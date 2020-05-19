$(document).ready(function() {
  $("#mybtn").on("click", function() {
    let beginDate = $("#beginDate").val();
    let endDate = $("#endDate").val();
    statistic_turnover_by_date(beginDate, endDate)
  });

  function statistic_turnover_by_date(beginDate = 0, endDate = 0) {
    jQuery.ajax({
      url: URLROOT + '/admins/statistic_turnover_by_date/' + beginDate + '/' + endDate,
      type: 'POST',
      success: function(data) {
        data = JSON.parse(data);

        let turnover = convertForChart(data['turnover']);
        console.log(turnover);

        let ctx = $('#myChart');
        let myChart = new Chart(ctx, {
          type: 'line',
          data: {
            labels: turnover['labels'],
            datasets: [{
              label: turnover['label'],
              data: turnover['data'],
              backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
              ],
              borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 1,
              fill: true
            }]
          },
          options: {
            scales: {
              yAxes: [{
                ticks: {
                  beginAtZero: true
                }
              }]
            }
          }
        });
      }
    });
  }

  function convertForChart(array) {
    let arrayLength = array.length;

    let labels = [];
    let data = [];
    let label = 'Turnover ($)';

    for (let i = 0; i < arrayLength; i++) {
      labels.push(array[i].order_date);
      data.push(myToFixed(array[i].turnover, 3));
    }

    let result = {
      labels:labels,
      data:data,
      label:label
    };

    return result;
  }
});
