const core = require('@actions/core');

function run() {
  try {
    // This is just a thin wrapper around bash
    const script = require('path').resolve(__dirname, 'script.sh');

    console.log(script);
    var child = require('child_process').execFile(script);
    child.stdout.on('data', (data) => {
      console.log(data.toString());
    });

    child.on('close', (code) => {
      console.log(`child process exited with code ${code}`);
      process.exit(code);
    });
  }
  catch (error) {
    core.setFailed(error.message);
  }
}

run()
