# Action Debugger

Interactive debugger for GitHub Actions

## Usage
```
steps:
- name: Setup Debug Session
  uses: csexton/debugger-action@master
```

In the log for the action you will see:

```
Running tmate...

To connect to this session copy-n-paste the following into a terminal:

ssh redactedMxoJ0pXmjredacted@nyc1.tmate.io
```

Simply follow the instructions and copy the ssh command into your terminal to create an ssh connection the running instance. The session will close immedeatly after closing the ssh connection to the running instance.

There is a global timeout after 15 minutes. This will close any open ssh sessions. To prevent the session from being terminated run:

```
touch /tmp/keepalive
```

## Acknowledgments

* [tmate.io](https://tmate.io)
* Max Schmitt's [action-tmate](https://github.com/mxschmitt/action-tmate)

### License

The action and associated scripts and documentation in this project are released under the MIT License.
