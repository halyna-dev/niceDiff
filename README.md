# niceDiff
:star:**niceDiff**:star: helps to get the difference between two branches in a readable html file.
![](niceDiff.gif)

#### How to use
1. Clone this repo
    ```
    git clone https://github.com/halyna-dev/niceDiff.git
    ```
2. Add niceDiff folder to your PATH variable. Don't forget reload your machine or logout/login from your windows account.
3. Run niceDiff command from your git repo
    ```
    niceDiff <branch1-name> <branch2-name> [optional <path-to-comparing-files>]
    ```
4. Open file in the your folder with git repo
    ```
    niceDiff-report.html
    ```

#### How it works
niceDiff is based on the standard git diff command. Magic is in batch parsing result. parseDiff.bat gets standard git diff output and tries to parse line by line.
