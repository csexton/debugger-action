const core = require('@actions/core');

async function run() {
  try {
    // This is just a thin wrapper around bash
    var child = require('child_process').execFile('./script.sh');
    child.stdout.on('data', function(data) {
      console.log(data.toString());
    });
  }
  catch (error) {
    core.setFailed(error.message);
  }
}

run()
