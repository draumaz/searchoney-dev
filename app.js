var fs = require('fs');
var files = fs.readdirSync('TRANSCRIPTS/YZ/');

d3.csv(files).then(function (data) {
  var transcript = data;
  var button = d3.select("#button");
  var form = d3.select("#form");
  button.on("click"), runEnter;
  form.on("submit"), runEnter;

  function runEnter() {
    d3.select("tbody").html("");
    d3.event.preventDefault();
    var inputValue = d3.select("#user-input").property("value");
    var filteredTranscripts = transcript.filter(transcript => transcript.Transcription.includes(inputValue));
    var output = _.sortBy(filteredTranscripts, 'avg_vote').reverse()
  
    for (var i = 0; i < filteredTranscripts.length; i++) {
	d3.select("tbody").insert("tr").html(
        '<td>' + [i+1] + '</td>' +
        '<td>' + (output[i]['Start Timestamp'])+'</a>'+'</td>' + 
        '<td>' + (output[i]['End Timestamp'])+'</td>' +
        '<td>' + (output[i]['Transcription'])+'</td'
      )
    }
  };
});
