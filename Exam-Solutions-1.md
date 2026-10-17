# DevOps Practical Exam - Every Question Ready to Run

Each question below is complete on its own: it lists what you need, the sample files, the code, and the exact steps to run it. You can do any one question without reading the others.

---

## 1. Shell Scripting

### S1. Factorial of a number

**Question:** Write a shell script to write a factorial of a number. (15 Marks)

**Needs:** a Linux/Mac terminal (or WSL / Git Bash on Windows) with `bash`.

**Code** (`factorial.sh`):

```bash
#!/bin/bash
read -p "Enter a number: " n
fact=1
for ((i=2; i<=n; i++)); do
fact=$((fact * i))
done
echo "Factorial of $n is $fact"
```

**How to run:**

```bash
nano factorial.sh        # paste the code, save (Ctrl+O, Enter, Ctrl+X)
chmod +x factorial.sh
./factorial.sh           # type a number, e.g. 5
```

### S2. Perfect number

**Question:** Write a shell script to check whether the number is perfect or not. (15 Marks)

**Needs:** a Linux/Mac terminal (or WSL / Git Bash on Windows) with `bash`.

**Code** (`perfect.sh`):

```bash
#!/bin/bash
read -p "Enter a number: " n
sum=0
for ((i=1; i<n; i++)); do
if (( n % i == 0 )); then
sum=$((sum + i))
fi
done
if (( sum == n && n > 0 )); then
echo "$n is a Perfect number"
else
echo "$n is NOT a Perfect number"
fi
```

**How to run:**

```bash
nano perfect.sh
chmod +x perfect.sh
./perfect.sh             # try 28 (perfect) and 12 (not perfect)
```

### S3. Count lines and words in a file

**Question:** Create a shell script to count the number of lines and words in a file. (15 Marks)

**Needs:** a Linux/Mac terminal (or WSL / Git Bash on Windows) with `bash`.

**Code** (`count_lines_words.sh`):

```bash
#!/bin/bash
read -p "Enter file name: " file
if [ ! -f "$file" ]; then
echo "File not found: $file"
exit 1
fi
echo "Lines : $(wc -l < "$file")"
echo "Words : $(wc -w < "$file")"
```

**How to run:**

```bash
printf 'hello world\nthis is a test\n\nfoo bar baz qux\n' > sample.txt   # sample file
nano count_lines_words.sh
chmod +x count_lines_words.sh
./count_lines_words.sh   # type: sample.txt
```

### S4. Count words, lines, characters (file name from command line)

**Question:** Write a shell script to count the number of words, lines and characters from a given file; accept the file name from the command line. (15 Marks)

**Needs:** a Linux/Mac terminal (or WSL / Git Bash on Windows) with `bash`.

**Code** (`wc_args.sh`):

```bash
#!/bin/bash
if [ $# -ne 1 ]; then
echo "Usage: $0 <filename>"
exit 1
fi
file="$1"
if [ ! -f "$file" ]; then
echo "File not found: $file"
exit 1
fi
echo "Lines : $(wc -l < "$file")"
echo "Words : $(wc -w < "$file")"
echo "Characters : $(wc -m < "$file")"
```

**How to run:**

```bash
printf 'hello world\nthis is a test\n\nfoo bar baz qux\n' > sample.txt   # sample file
nano wc_args.sh
chmod +x wc_args.sh
./wc_args.sh sample.txt  # file name is given on the command line
./wc_args.sh             # no argument: prints the usage message
```

### S5. Pattern 0 / 0 1 / 0 1 2 / 0 1 2 3

**Question:** Write a shell script to print the pattern 0, 0 1, 0 1 2, 0 1 2 3. (25 Marks)

**Needs:** a Linux/Mac terminal (or WSL / Git Bash on Windows) with `bash`.

**Code** (`pattern1.sh`):

```bash
#!/bin/bash
for ((i=0; i<4; i++)); do
for ((j=0; j<=i; j++)); do
echo -n "$j "
done
echo
done
```

**How to run:**

```bash
nano pattern1.sh
chmod +x pattern1.sh
./pattern1.sh
```

### S6. Pattern 1 / 1 2 1 / 1 3 3 1 (Pascal's triangle)

**Question:** Write a shell script to print the pattern 1, 1 2 1, 1 3 3 1. (25 Marks)

**Needs:** a Linux/Mac terminal (or WSL / Git Bash on Windows) with `bash`.

**Code** (`pascal.sh`):

```bash
#!/bin/bash
rows=4
for ((i=0; i<rows; i++)); do
  # print spaces first (to make a pyramid)
  for ((s=1; s<rows-i; s++)); do
    echo -n " "
  done
  # print the numbers of this row
  c=1
  for ((j=0; j<=i; j++)); do
    echo -n "$c "
    c=$((c*(i-j)/(j+1)))
  done
  echo
done
```

**How to run:**

```bash
nano pascal.sh
chmod +x pascal.sh
./pascal.sh
```

### S7. Delete all empty lines from a file

**Question:** Write a shell script to delete all empty lines from any file. (15 Marks)

**Needs:** a Linux/Mac terminal (or WSL / Git Bash on Windows) with `bash`.

**Code** (`remove_empty.sh`):

```bash
#!/bin/bash
read -p "Enter file name: " file
if [ ! -f "$file" ]; then
echo "File not found: $file"
exit 1
fi
sed -i '/^[[:space:]]*$/d' "$file"
echo "Empty lines removed from $file"
cat "$file"
```

**How to run:**

```bash
printf 'line1\n\nline2\n\n\nline3\n' > blank.txt   # sample file with empty lines
nano remove_empty.sh
chmod +x remove_empty.sh
./remove_empty.sh        # type: blank.txt
```

### S8. Reverse a string

**Question:** Write a shell script to reverse a string. (15 Marks)

**Needs:** a Linux/Mac terminal (or WSL / Git Bash on Windows) with `bash`.

**Code** (`reverse_string.sh`):

```bash
#!/bin/bash
read -p "Enter a string: " str
rev_str=""
for ((i=${#str}-1; i>=0; i--)); do
rev_str="$rev_str${str:$i:1}"
done
echo "Reversed: $rev_str"
```

**How to run:**

```bash
nano reverse_string.sh
chmod +x reverse_string.sh
./reverse_string.sh      # type: DevOps
```

### S9. Maximum of three numbers

**Question:** Write a shell script to find the max of 3 numbers. (15 Marks)

**Needs:** a Linux/Mac terminal (or WSL / Git Bash on Windows) with `bash`.

**Code** (`max3.sh`):

```bash
#!/bin/bash
read -p "Enter three numbers: " a b c
max=$a
(( b > max )) && max=$b
(( c > max )) && max=$c
echo "Maximum is $max"
```

**How to run:**

```bash
nano max3.sh
chmod +x max3.sh
./max3.sh                # type: 12 45 7
```

### S10. Reverse array elements

**Question:** Write a shell script to reverse array elements. (15 Marks)

**Needs:** a Linux/Mac terminal (or WSL / Git Bash on Windows) with `bash`.

**Code** (`reverse_array.sh`):

```bash
#!/bin/bash
arr=(10 20 30 40 50)
echo "Original: ${arr[@]}"
rev=()
for ((i=${#arr[@]}-1; i>=0; i--)); do
rev+=("${arr[$i]}")
done
echo "Reversed: ${rev[@]}"
```

**How to run:**

```bash
nano reverse_array.sh
chmod +x reverse_array.sh
./reverse_array.sh
```

### S11. Delete all text files from a directory

**Question:** Write a shell script to delete all text files from the directory. (15 Marks)

**Needs:** a Linux/Mac terminal (or WSL / Git Bash on Windows) with `bash`.

**Code** (`delete_txt.sh`):

```bash
#!/bin/bash
read -p "Enter directory path: " dir
if [ ! -d "$dir" ]; then
echo "Directory not found: $dir"
exit 1
fi
echo "Deleting these files:"
ls "$dir"/*.txt 2>/dev/null || { echo "No .txt files found"; exit 0; }
rm -f "$dir"/*.txt
echo "Done."
```

**How to run:**

```bash
mkdir testdir                                  # sample directory
touch testdir/a.txt testdir/b.txt testdir/keep.log
nano delete_txt.sh
chmod +x delete_txt.sh
./delete_txt.sh          # type: testdir
ls testdir               # only keep.log is left
```

### S12. Compile all C files and delete those with errors

**Question:** Write a shell script to compile all C files and delete those files having errors. (25 Marks)

**Needs:** a Linux/Mac terminal (or WSL / Git Bash on Windows) with `bash`.

**Needs:** `gcc` installed (`sudo apt install gcc` on Ubuntu).

**Code** (`compile_c.sh`):

```bash
#!/bin/bash
for f in *.c; do
[ -e "$f" ] || { echo "No .c files found"; exit 0; }
if gcc "$f" -o "${f%.c}.out" 2>/dev/null; then
echo "OK : $f compiled"
else
echo "ERROR : $f has errors -> deleting"
rm -f "$f"
fi
done
```

**How to run** (use a new empty folder, because the script deletes `.c` files):

```bash
mkdir c_test && cd c_test
printf '#include <stdio.h>\nint main(){ printf("hi\\n"); return 0; }\n' > good.c
printf '#include <stdio.h>\nint main(){ printf("hi\\n") return 0; }\n' > bad.c   # missing semicolon
nano compile_c.sh
chmod +x compile_c.sh
./compile_c.sh
ls                       # bad.c is gone; good.c and good.out remain
```

### S13. Pipe command and changing the system date

**Question:** Write a shell script to illustrate the use of the pipe command and change the system date. (15 Marks)

**Needs:** a Linux/Mac terminal (or WSL / Git Bash on Windows) with `bash`.

**Needs:** `sudo` access. The script changes the real system clock, so use a practice machine.

**Code** (`pipe_date.sh`):

```bash
#!/bin/bash
echo "--- Pipe demo ---"
ls -l | wc -l # count entries
ps aux | grep bash | head -3 # first 3 bash processes
cat /etc/passwd | cut -d: -f1 | sort | head -5 # first 5 usernames, sorted
echo "--- Date demo ---"
echo "Current date: $(date)"
sudo date -s "2026-12-25 10:30:00" # needs root
echo "New date : $(date)"
```

**How to run:**

```bash
nano pipe_date.sh
chmod +x pipe_date.sh
./pipe_date.sh                      # enter your sudo password when asked
sudo timedatectl set-ntp true       # afterwards: reset the clock to the correct time
```

---

## 2. Git & GitHub

### G1. Clone a public repository and pull files

**Question:** Clone an existing public repository and pull files from it. (15 Marks)

**Needs:** `git` installed (`git --version`) and internet.

**Login:** none needed (public repository).

**Needs:** internet only. No GitHub login is needed for a public repo.

**How to run:**

```bash
git clone https://github.com/octocat/Hello-World.git
cd Hello-World
git pull
git log --oneline | head -3
```

### G2. Create a GitHub tag

**Question:** Create a GitHub tag for any repository. (15 Marks)

**Needs:** `git` installed (`git --version`).

Set your name and email once (needed for commits and annotated tags):

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

**Login (GitHub, in the browser):**

1. Go to github.com -> **Sign in** (no account? click **Sign up** and verify your email).
2. Enter your username and password, then the 2FA code if you have it turned on.
3. You are logged in when you see your profile picture at the top right.

**Login for pushing from the terminal** (GitHub does not accept your account password for `git push`):

*Option 1 - personal access token:*

1. On github.com click your profile picture -> **Settings** -> **Developer settings** (bottom of the left menu) -> **Personal access tokens** -> **Tokens (classic)** -> **Generate new token (classic)**.
2. Give it a name, tick the **repo** scope (also **workflow** if you will push workflow files), click **Generate token**.
3. Copy the token immediately (it is shown only once).
4. When `git push` asks, type your GitHub username as Username and paste the token as Password.

*Option 2 - GitHub CLI:* install `gh`, run `gh auth login`, choose GitHub.com -> HTTPS -> Login with a web browser, and enter the one-time code shown in the terminal.

**Setup (do once):**

1. Log in at github.com -> **+ -> New repository** -> name it `tag-demo` -> Create (do not add a README).
2. Have your personal access token ready (or be logged in with `gh auth login`); you paste it when `git push` asks for a password.
3. Create a local repo with one commit and link it to GitHub:

```bash
mkdir tag-demo && cd tag-demo
git init -b main
echo "hello" > a.txt
git add .
git commit -m "first commit"
git remote add origin https://github.com/<your-username>/tag-demo.git
git push -u origin main          # paste the token when asked for a password
```

**Code / How to run:**

```bash
git tag v1.0 # lightweight tag
git tag -a v1.1 -m "Release 1.1" # annotated tag (has author, date, message)
git tag # list tags
git push origin v1.0 v1.1 # publish tags to GitHub
```

**Check:** on github.com open the repo and click **Tags** (next to Branches). `v1.0` and `v1.1` are listed.

### G3. Run any 4 GitHub commands and print logs

**Question:** Run any 4 GitHub commands and print the logs from them. (15 Marks)

**Needs:** `git` installed (`git --version`).

Set your name and email once (needed for commits and annotated tags):

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

**Login:** none needed (everything is local).

**Setup:** a local repo with two commits (no GitHub needed):

```bash
mkdir log-demo && cd log-demo
git init -b main
echo "one" > a.txt
git add .
git commit -m "first commit"
echo "two" >> a.txt
git commit -am "second commit"
```

**Code / How to run:**

```bash
git status -sb # 1. working tree status
git branch # 2. list branches
git log --oneline # 3. commit history (the "log")
git diff HEAD~1 --stat # 4. what changed in the last commit
```

To save the log to a file:

```bash
git log > git_log.txt
```

### G4. Create a webhook for GitHub using ngrok

**Question:** Create a webhook for GitHub using ngrok. (15 Marks)

**Needs:** Node.js installed (`node --version`), `git`, a GitHub repo you can commit to, and a free ngrok account.

**Login (GitHub, in the browser):**

1. Go to github.com -> **Sign in** (no account? click **Sign up** and verify your email).
2. Enter your username and password, then the 2FA code if you have it turned on.
3. You are logged in when you see your profile picture at the top right.

**Login (ngrok):**

1. Go to ngrok.com -> **Sign up** (or **Log in**) with email, Google or GitHub.
2. Open the dashboard -> **Your Authtoken** and copy it.
3. In the terminal run `ngrok config add-authtoken <your-token>` (one time).

You can trigger the webhook by editing a file on github.com and committing, so no push token is needed.

**Setup (do once):**

1. Install ngrok from ngrok.com (download, or `sudo snap install ngrok`).
2. Log in to ngrok, copy your authtoken from its dashboard, then run:

```bash
ngrok config add-authtoken <your-token>
```

3. Have a GitHub repo you can push to (**+ -> New repository**).

**Code** (`webhook_server.js`):

```javascript
const http = require('http');
http.createServer((req, res) => {
if (req.method === 'POST' && req.url === '/webhook') {
let body = '';
req.on('data', chunk => (body += chunk));
req.on('end', () => {
const event = req.headers['x-github-event'] || 'unknown';
let repo = 'unknown';
try { repo = JSON.parse(body).repository.full_name; } catch (e) {}
console.log(`Received "${event}" event from ${repo}`);
res.writeHead(200);
res.end('OK');
});
} else {
res.writeHead(200);
res.end('Webhook server is running');
}
}).listen(3000, () => console.log('Listening on port 3000'));
```

**How to run:**

1. Terminal 1 - start the receiver:

```bash
node webhook_server.js
```

2. Terminal 2 - start the tunnel:

```bash
ngrok http 3000
```

ngrok prints a forwarding URL such as `https://abcd-1234.ngrok-free.app`.

3. On GitHub: repository -> Settings -> Webhooks -> Add webhook:
   - Payload URL: `https://abcd-1234.ngrok-free.app/webhook`
   - Content type: `application/json`
   - Events: Just the push event
4. Push any commit to the repo (or edit a file on github.com and commit).

**Check:** Terminal 1 prints `Received "push" event from <user>/<repo>`. GitHub's Recent Deliveries tab shows a green tick, and the ngrok inspector at `http://127.0.0.1:4040` shows the request.

---

## 3. GitHub Actions

### A1. Run Node.js tests on every push to main

**Question:** Create GitHub Actions that run every time the code is pushed to the main branch and run Node.js tests, e.g. `npm run test`. (25 Marks)

**Needs:** a GitHub account. Nothing to install; GitHub Actions is built in and on by default. The workflow runs by itself when you push to `main` (from the line `on: push: branches: [main]`); there is no run button. The workflow file must be in exactly `.github/workflows/` (dot at the start, `workflows` spelled correctly) and end in `.yml`.

**Login (GitHub, in the browser):**

1. Go to github.com -> **Sign in** (no account? click **Sign up** and verify your email).
2. Enter your username and password, then the 2FA code if you have it turned on.
3. You are logged in when you see your profile picture at the top right.

Everything is done in the browser, so no token is needed.

**Project files** (create these in your repo):

`package.json`:

```json
{
  "name": "node-demo",
  "version": "1.0.0",
  "scripts": { "test": "node test.js" }
}
```

`test.js`:

```javascript
const assert = require('assert');
assert.strictEqual(1 + 1, 2);
console.log('Test passed');
```

**Code** (`.github/workflows/node-test.yml`):

```yaml
name: Node.js Tests
on:
  push:
    branches: [main]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
      - name: Install dependencies
        run: npm install
      - name: Run tests
        run: npm run test
```

**How to run:**

1. github.com -> **+ -> New repository** -> name it, set Public -> Create.
2. **Add file -> Upload files** -> upload `package.json` and `test.js` -> **Commit changes** (on `main`).
3. **Add file -> Create new file** -> type the name `.github/workflows/node-test.yml` (typing `/` creates the folders) -> paste the YAML -> **Commit changes** on `main`.
4. Open the **Actions** tab. The run starts by itself within seconds. Click the run -> click the job -> open each step to see its log.

**Check:** green tick = tests passed. To run it again, push any small change or click **Re-run all jobs**.

**If something is wrong:** if the Actions tab shows nothing, the folder name is wrong, you pushed to a different branch, or the file does not end in `.yml`. If the run has a red cross, click the failed step and read the error.

### A2. Python project - clean package

**Question:** Consider the given Python project available on your machine and create a GitHub pipeline to demonstrate clean package. (25 Marks)

**Needs:** a GitHub account. Nothing to install; GitHub Actions is built in and on by default. The workflow runs by itself when you push to `main` (from the line `on: push: branches: [main]`); there is no run button. The workflow file must be in exactly `.github/workflows/` (dot at the start, `workflows` spelled correctly) and end in `.yml`.

**Login (GitHub, in the browser):**

1. Go to github.com -> **Sign in** (no account? click **Sign up** and verify your email).
2. Enter your username and password, then the 2FA code if you have it turned on.
3. You are logged in when you see your profile picture at the top right.

Everything is done in the browser, so no token is needed.

**Project files** (use your given project; it must have a `pyproject.toml` or `setup.py`. A minimal sample):

`pyproject.toml`:

```toml
[build-system]
requires = ["setuptools>=61"]
build-backend = "setuptools.build_meta"

[project]
name = "mypkg"
version = "0.1.0"
```

`mypkg/__init__.py`:

```python
def add(a, b):
    return a + b
```

**Code** (`.github/workflows/python-clean-package.yml`):

```yaml
name: Python Clean Package
on:
  push:
    branches: [main]
jobs:
  clean-package:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.12'
      - name: Install build tool
        run: pip install build
      - name: Clean old build output
        run: rm -rf build/ dist/ *.egg-info
      - name: Build package
        run: python -m build
      - name: Show built package
        run: ls -l dist/
```

**How to run:**

1. github.com -> **+ -> New repository** -> Public -> Create.
2. **Add file -> Upload files** -> upload the project files (keep the `mypkg` folder) -> **Commit changes** on `main`.
3. **Add file -> Create new file** -> name `.github/workflows/python-clean-package.yml` -> paste the YAML -> **Commit changes** on `main`.
4. Open the **Actions** tab -> click the run -> open the "Show built package" step.

**Check:** green tick, and the last step lists the `.tar.gz` and `.whl` files in `dist/`.

**If something is wrong:** if the Actions tab shows nothing, the folder name is wrong, you pushed to a different branch, or the file does not end in `.yml`. If the run has a red cross, click the failed step and read the error.

### A3. Python project - run JUnit tests and generate a report

**Question:** Consider the given Python project and create a GitHub pipeline to demonstrate running JUnit tests and generating a report. (25 Marks)

**Needs:** a GitHub account. Nothing to install; GitHub Actions is built in and on by default. The workflow runs by itself when you push to `main` (from the line `on: push: branches: [main]`); there is no run button. The workflow file must be in exactly `.github/workflows/` (dot at the start, `workflows` spelled correctly) and end in `.yml`.

**Login (GitHub, in the browser):**

1. Go to github.com -> **Sign in** (no account? click **Sign up** and verify your email).
2. Enter your username and password, then the 2FA code if you have it turned on.
3. You are logged in when you see your profile picture at the top right.

Everything is done in the browser, so no token is needed.

**Project files** (use your given project; it needs `requirements.txt` and pytest tests. A minimal sample):

`requirements.txt`:

```
pytest
```

`test_sample.py`:

```python
def test_add():
    assert 1 + 1 == 2
```

**Code** (`.github/workflows/python-junit.yml`):

```yaml
name: Python JUnit Report
on:
  push:
    branches: [main]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.12'
      - name: Install dependencies
        run: pip install -r requirements.txt pytest
      - name: Run tests and generate JUnit XML report
        run: pytest --junitxml=report.xml
      - name: Upload test report
        if: always()
        uses: actions/upload-artifact@v4
        with:
          name: junit-report
          path: report.xml
```

**How to run:**

1. github.com -> **+ -> New repository** -> Public -> Create.
2. **Add file -> Upload files** -> upload `requirements.txt` and `test_sample.py` -> **Commit changes** on `main`.
3. **Add file -> Create new file** -> name `.github/workflows/python-junit.yml` -> paste the YAML -> **Commit changes** on `main`.
4. Open the **Actions** tab -> click the run.
5. Scroll to the bottom of the run page, find **Artifacts**, and click `junit-report` to download the report.

**Check:** green tick, and the downloaded `report.xml` shows `tests="1" failures="0"`.

**If something is wrong:** if the Actions tab shows nothing, the folder name is wrong, you pushed to a different branch, or the file does not end in `.yml`. If the run has a red cross, click the failed step and read the error.

### A4. Node.js lint errors stored in a file

**Question:** Create a GitHub workflow that runs Node.js lint errors and stores them in a file. (25 Marks)

**Needs:** a GitHub account. Nothing to install; GitHub Actions is built in and on by default. The workflow runs by itself when you push to `main` (from the line `on: push: branches: [main]`); there is no run button. The workflow file must be in exactly `.github/workflows/` (dot at the start, `workflows` spelled correctly) and end in `.yml`.

**Login (GitHub, in the browser):**

1. Go to github.com -> **Sign in** (no account? click **Sign up** and verify your email).
2. Enter your username and password, then the 2FA code if you have it turned on.
3. You are logged in when you see your profile picture at the top right.

Everything is done in the browser, so no token is needed.

**Project files** (use your given project; it needs ESLint in `package.json`. A minimal sample with deliberate lint errors):

`package.json`:

```json
{
  "name": "lint-demo",
  "version": "1.0.0",
  "devDependencies": { "eslint": "^9.0.0" }
}
```

`eslint.config.js`:

```javascript
module.exports = [
{
files: ['**/*.js'],
languageOptions: {
sourceType: 'commonjs',
globals: { require: 'readonly', module: 'readonly',
console: 'readonly', process: 'readonly' }
},
rules: { 'no-unused-vars': 'error', 'semi': ['error', 'always'] },
},
];
```

`app.js`:

```javascript
const unused = 5
console.log('hi')
```

**Code** (`.github/workflows/node-lint.yml`):

```yaml
name: Node.js Lint
on:
  push:
    branches: [main]
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
      - run: npm install
      - name: Run ESLint and save errors to a file
        run: npx eslint . -o lint-report.txt || true
      - name: Show the report
        run: cat lint-report.txt
      - name: Upload lint report
        uses: actions/upload-artifact@v4
        with:
          name: lint-report
          path: lint-report.txt
```

**How to run:**

1. github.com -> **+ -> New repository** -> Public -> Create.
2. **Add file -> Upload files** -> upload `package.json`, `eslint.config.js` and `app.js` -> **Commit changes** on `main`.
3. **Add file -> Create new file** -> name `.github/workflows/node-lint.yml` -> paste the YAML -> **Commit changes** on `main`.
4. Open the **Actions** tab -> click the run -> open the "Show the report" step.
5. Scroll to **Artifacts** at the bottom and download `lint-report`.

**Check:** the run is green (because of `|| true`), the "Show the report" step lists the lint errors, and the downloaded `lint-report.txt` contains them.

**If something is wrong:** if the Actions tab shows nothing, the folder name is wrong, you pushed to a different branch, or the file does not end in `.yml`. If the run has a red cross, click the failed step and read the error.

---

## 4. Docker

### D1. Dockerfile to build a Node.js container

**Question:** Create a Dockerfile to build a Node.js container. (25 Marks)

**Needs:** Docker installed and running (`docker --version` works and `docker ps` shows no error). On Linux you may need `sudo` before `docker`.

**Login:** none needed (public images pull without a Docker Hub login).

**Setup:** make a folder and put these three files in it.

```bash
mkdir node-docker && cd node-docker
```

`server.js`:

```javascript
const http = require('http');
const PORT = process.env.PORT || 3000;
http.createServer((req, res) => {
res.writeHead(200, { 'Content-Type': 'text/html' });
res.end('<h1>Hello from Node.js running in Docker!</h1>');
}).listen(PORT, '0.0.0.0', () => console.log(`Server running on ${PORT}`));
```

`package.json`:

```json
{
"name": "docker-node-demo",
"version": "1.0.0",
"main": "server.js",
"scripts": { "start": "node server.js" }
}
```

**Code** (`Dockerfile`, no extension):

```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "server.js"]
```

**How to run:**

```bash
docker build -t node-app .
docker images            # node-app is listed
```

### D2. Build and run the container; open it in the browser

**Question:** Build and run a Docker container to ensure the Node.js app is running and accessible from the browser. (25 Marks)

**Needs:** Docker installed and running (`docker --version` works and `docker ps` shows no error). On Linux you may need `sudo` before `docker`.

**Login:** none needed (public images pull without a Docker Hub login).

**Setup:** make a folder with these three files.

```bash
mkdir node-docker && cd node-docker
```

`server.js`:

```javascript
const http = require('http');
const PORT = process.env.PORT || 3000;
http.createServer((req, res) => {
res.writeHead(200, { 'Content-Type': 'text/html' });
res.end('<h1>Hello from Node.js running in Docker!</h1>');
}).listen(PORT, '0.0.0.0', () => console.log(`Server running on ${PORT}`));
```

`package.json`:

```json
{
"name": "docker-node-demo",
"version": "1.0.0",
"main": "server.js",
"scripts": { "start": "node server.js" }
}
```

`Dockerfile`:

```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "server.js"]
```

**How to run:**

```bash
docker build -t node-app . # build the image
docker run -d --name node-app -p 3000:3000 node-app # run it
docker ps # confirm it is "Up"
curl http://localhost:3000 # or open in the browser
docker logs node-app # shows: Server running on port 3000
```

**Check:** open `http://localhost:3000` in the browser. It shows "Hello from Node.js running in Docker!". If port 3000 is busy, use `-p 3001:3000` and open port 3001.

### D3. Pull any image from Docker Hub and run it

**Question:** Pull any Docker image from the hub and run it. (25 Marks)

**Needs:** Docker installed and running (`docker --version` works and `docker ps` shows no error). On Linux you may need `sudo` before `docker`.

**Login:** none needed (public images pull without a Docker Hub login).

**Needs:** Docker running and internet. Port 8080 must be free.

**How to run:**

```bash
docker pull nginx:alpine # download from Docker Hub
docker images # confirm it is stored locally
docker run -d --name web -p 8080:80 nginx:alpine
docker ps # shows web, port 8080->80
curl http://localhost:8080 # nginx welcome page
```

**Check:** open `http://localhost:8080` in the browser. It shows "Welcome to nginx!". (`docker run hello-world` is a smaller alternative that just prints a message.)

### D4. docker exec, docker rm, docker rmi

**Question:** Execute the Docker commands docker exec, docker rm, docker rmi. (25 Marks)

**Needs:** Docker installed and running (`docker --version` works and `docker ps` shows no error). On Linux you may need `sudo` before `docker`.

**Login:** none needed (public images pull without a Docker Hub login).

**Setup:** start a container to work on (skip this if a container named `web` is already running).

```bash
docker run -d --name web -p 8080:80 nginx:alpine
```

**How to run:**

```bash
docker exec -it web sh # open a shell INSIDE the running container
# / # ls /usr/share/nginx/html (run commands, then type: exit)
docker exec web nginx -v # run a single command inside it
docker stop web # a running container must be stopped first
docker rm web # remove the container
docker rm -f web # (alternative) force-remove a running container
docker rmi nginx:alpine # remove the IMAGE (only if no container uses it)
docker images # nginx:alpine is gone
```

---

## 5. Docker Compose

### C1. Docker Compose file with a MySQL server

**Question:** Create a Docker Compose file to contain a MySQL server. (25 Marks)

**Needs:** Docker installed and running with Compose v2 (`docker compose version` works). Port 3306 must be free (stop any local MySQL). After `up -d`, wait 20-30 seconds before connecting, because MySQL takes time to start.

**Login:** none needed (public images pull without a Docker Hub login).

**Setup:**

```bash
mkdir mysql-compose && cd mysql-compose
```

**Code** (`docker-compose.yml` in that folder):

```yaml
services:
  mysql:
    image: mysql:8.0
    container_name: mysql-server
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: rootpass
      MYSQL_DATABASE: appdb
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql
volumes:
  mysql_data:
```

**How to run:**

```bash
docker compose up -d
docker compose ps
docker exec -it mysql-server mysql -uroot -prootpass -e "SHOW DATABASES;"
docker compose down # stop (data stays in the mysql_data volume)
```

### C2. Docker Compose file for MySQL user creation

**Question:** Write a Docker Compose file for MySQL user creation; pull any Docker image from the hub and run it. (25 Marks)

**Needs:** Docker installed and running with Compose v2 (`docker compose version` works). Port 3306 must be free (stop any local MySQL). After `up -d`, wait 20-30 seconds before connecting, because MySQL takes time to start.

**Login:** none needed (public images pull without a Docker Hub login).

**Setup:**

```bash
mkdir mysql-user && cd mysql-user
```

**Code** (`docker-compose.yml` in that folder):

```yaml
services:
  mysql:
    image: mysql:8.0
    container_name: mysql-server
    environment:
      MYSQL_ROOT_PASSWORD: rootpass
      MYSQL_DATABASE: appdb
      MYSQL_USER: appuser
      MYSQL_PASSWORD: apppass
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql
volumes:
  mysql_data:
```

**How to run:**

```bash
docker compose pull # pulls mysql:8.0 from Docker Hub
docker compose up -d # runs it
docker exec -it mysql-server mysql -uappuser -papppass -e "SHOW DATABASES;"
```

**Check:** logging in as `appuser` works and lists the `appdb` database. The user variables only take effect the first time (when the volume is empty). To reset, run `docker compose down -v` and start again. If another MySQL container named `mysql-server` already exists, run `docker rm -f mysql-server` first.

---

## 6. Jenkins

### J1. Check out code from GitHub and start a Node app

**Question:** Create a Jenkins pipeline to check out code from GitHub and start a Node app. (15 Marks)

**Needs:** Jenkins running, and `git` + Node.js installed on the machine where Jenkins runs. The plain `jenkins/jenkins:lts` Docker image does not include Node.js, so use a Jenkins installed on the machine, or install Node.js in the container. Start Jenkins with Docker if it is not installed:

```bash
docker run -d -p 8080:8080 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```

**Login (GitHub, in the browser):**

1. Go to github.com -> **Sign in** (no account? click **Sign up** and verify your email).
2. Enter your username and password, then the 2FA code if you have it turned on.
3. You are logged in when you see your profile picture at the top right.

**Login (Jenkins, in the browser):**

1. Open `http://localhost:8080`.
2. First time only: it asks for the Administrator password. Get it with `sudo cat /var/lib/jenkins/secrets/initialAdminPassword` (or `docker logs <container-name>` if you started Jenkins with Docker). Paste it, choose **Install suggested plugins**, create your admin user, then Save and Finish.
3. Next times: log in with the username and password you created.

GitHub login is only needed to create the repo and upload the files; Jenkins clones a public repo without logging in.

**Repo files** (upload to your GitHub repo):

`server.js`:

```javascript
const http = require('http');
const PORT = process.env.PORT || 3000;
http.createServer((req, res) => {
res.writeHead(200, { 'Content-Type': 'text/html' });
res.end('<h1>Hello from Node.js running in Docker!</h1>');
}).listen(PORT, '0.0.0.0', () => console.log(`Server running on ${PORT}`));
```

`package.json`:

```json
{
"name": "docker-node-demo",
"version": "1.0.0",
"main": "server.js",
"scripts": { "start": "node server.js" }
}
```

**Code** (paste in Pipeline script):

```groovy
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/<your-username>/<your-node-repo>.git'
            }
        }
        stage('Install') {
            steps { sh 'npm install' }
        }
        stage('Start App') {
            steps {
                withEnv(['BUILD_ID=dontKillMe', 'JENKINS_NODE_COOKIE=dontKillMe']) {
                    sh 'nohup node server.js > app.log 2>&1 &'
                }
                sh 'sleep 3 && curl -s http://localhost:3000'
            }
        }
    }
}
```

**How to run:**

1. Make sure Jenkins is running and open `http://localhost:8080` in the browser; log in.
2. On github.com click **+ -> New repository**, name it, set it to **Public**, click Create. Then **Add file -> Upload files**, upload the repo files listed above, and **Commit changes** on `main`.
3. In Jenkins click **New Item**, type a name, choose **Pipeline**, click OK.
4. Scroll down to the **Pipeline** section (keep Definition as "Pipeline script") and paste the code above into the box. Replace `<your-username>` and `<your-node-repo>` with your real GitHub username and repo name. If your branch is `master`, change `branch: 'main'` to `'master'`. Click **Save**.
5. Click **Build Now**. Under Build History click the build number, then **Console Output**. A green ball means success; a red ball means failure and the error is at the bottom of the console.
6. Port 3000 must be free on the Jenkins machine.

**Check:** Console Output shows the repo being cloned, `npm install` running, and `curl` printing the app's HTML. `BUILD_ID=dontKillMe` keeps the app alive after the build finishes.

### J2. Node project - install dependencies

**Question:** Consider the given Node.js project available on your machine and create a GitHub Jenkins pipeline to demonstrate installing dependencies. (25 Marks)

**Needs:** Jenkins running, and `git` + Node.js installed on the machine where Jenkins runs. The plain `jenkins/jenkins:lts` Docker image does not include Node.js, so use a Jenkins installed on the machine, or install Node.js in the container. Start Jenkins with Docker if it is not installed:

```bash
docker run -d -p 8080:8080 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```

**Login (GitHub, in the browser):**

1. Go to github.com -> **Sign in** (no account? click **Sign up** and verify your email).
2. Enter your username and password, then the 2FA code if you have it turned on.
3. You are logged in when you see your profile picture at the top right.

**Login (Jenkins, in the browser):**

1. Open `http://localhost:8080`.
2. First time only: it asks for the Administrator password. Get it with `sudo cat /var/lib/jenkins/secrets/initialAdminPassword` (or `docker logs <container-name>` if you started Jenkins with Docker). Paste it, choose **Install suggested plugins**, create your admin user, then Save and Finish.
3. Next times: log in with the username and password you created.

GitHub login is only needed to create the repo and upload the files; Jenkins clones a public repo without logging in.

**Repo files** (use your given project; a minimal sample with one dependency):

`package.json`:

```json
{
  "name": "node-demo",
  "version": "1.0.0",
  "dependencies": { "lodash": "^4.17.21" }
}
```

**Code** (paste in Pipeline script):

```groovy
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/<your-username>/<your-node-repo>.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'node --version'
                sh 'npm --version'
                sh 'npm install'
            }
        }
    }
    post {
        success { echo 'Dependencies installed successfully' }
        failure { echo 'Dependency installation failed' }
    }
}
```

**How to run:**

1. Make sure Jenkins is running and open `http://localhost:8080` in the browser; log in.
2. On github.com click **+ -> New repository**, name it, set it to **Public**, click Create. Then **Add file -> Upload files**, upload the repo files listed above, and **Commit changes** on `main`.
3. In Jenkins click **New Item**, type a name, choose **Pipeline**, click OK.
4. Scroll down to the **Pipeline** section (keep Definition as "Pipeline script") and paste the code above into the box. Replace `<your-username>` and `<your-node-repo>` with your real GitHub username and repo name. If your branch is `master`, change `branch: 'main'` to `'master'`. Click **Save**.
5. Click **Build Now**. Under Build History click the build number, then **Console Output**. A green ball means success; a red ball means failure and the error is at the bottom of the console.

**Check:** Console Output shows the Node and npm versions, then `added N packages`, then `Dependencies installed successfully`.

### J3. Node project - start the application

**Question:** Consider the given Node.js project and create a GitHub Jenkins pipeline to demonstrate starting the application. (25 Marks)

**Needs:** Jenkins running, and `git` + Node.js installed on the machine where Jenkins runs. The plain `jenkins/jenkins:lts` Docker image does not include Node.js, so use a Jenkins installed on the machine, or install Node.js in the container. Start Jenkins with Docker if it is not installed:

```bash
docker run -d -p 8080:8080 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```

**Login (GitHub, in the browser):**

1. Go to github.com -> **Sign in** (no account? click **Sign up** and verify your email).
2. Enter your username and password, then the 2FA code if you have it turned on.
3. You are logged in when you see your profile picture at the top right.

**Login (Jenkins, in the browser):**

1. Open `http://localhost:8080`.
2. First time only: it asks for the Administrator password. Get it with `sudo cat /var/lib/jenkins/secrets/initialAdminPassword` (or `docker logs <container-name>` if you started Jenkins with Docker). Paste it, choose **Install suggested plugins**, create your admin user, then Save and Finish.
3. Next times: log in with the username and password you created.

GitHub login is only needed to create the repo and upload the files; Jenkins clones a public repo without logging in.

**Repo files** (use your given project; it needs a `start` script. A minimal sample):

`server.js`:

```javascript
const http = require('http');
const PORT = process.env.PORT || 3000;
http.createServer((req, res) => {
res.writeHead(200, { 'Content-Type': 'text/html' });
res.end('<h1>Hello from Node.js running in Docker!</h1>');
}).listen(PORT, '0.0.0.0', () => console.log(`Server running on ${PORT}`));
```

`package.json`:

```json
{
"name": "docker-node-demo",
"version": "1.0.0",
"main": "server.js",
"scripts": { "start": "node server.js" }
}
```

**Code** (paste in Pipeline script):

```groovy
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/<your-username>/<your-node-repo>.git'
            }
        }
        stage('Install Dependencies') {
            steps { sh 'npm install' }
        }
        stage('Start Application') {
            steps {
                withEnv(['BUILD_ID=dontKillMe', 'JENKINS_NODE_COOKIE=dontKillMe']) {
                    sh 'nohup npm start > app.log 2>&1 &'
                }
                sh 'sleep 3'
                sh 'cat app.log'
                sh 'curl -s http://localhost:3000 || echo "App not reachable"'
            }
        }
    }
}
```

**How to run:**

1. Make sure Jenkins is running and open `http://localhost:8080` in the browser; log in.
2. On github.com click **+ -> New repository**, name it, set it to **Public**, click Create. Then **Add file -> Upload files**, upload the repo files listed above, and **Commit changes** on `main`.
3. In Jenkins click **New Item**, type a name, choose **Pipeline**, click OK.
4. Scroll down to the **Pipeline** section (keep Definition as "Pipeline script") and paste the code above into the box. Replace `<your-username>` and `<your-node-repo>` with your real GitHub username and repo name. If your branch is `master`, change `branch: 'main'` to `'master'`. Click **Save**.
5. Click **Build Now**. Under Build History click the build number, then **Console Output**. A green ball means success; a red ball means failure and the error is at the bottom of the console.
6. Port 3000 must be free on the Jenkins machine.

**Check:** Console Output shows `Server running on 3000` from `app.log`, then the app's HTML from `curl`.

### J4. Python project - send reports by email

**Question:** Consider the given Python project available on your machine and create a GitHub Jenkins pipeline to send reports by email. (25 Marks)

**Needs:** Jenkins running, and `git` + Python 3 (with the `venv` module) installed on the machine where Jenkins runs. The plain `jenkins/jenkins:lts` Docker image does not include Python, so use a Jenkins installed on the machine, or install Python 3 in the container. Start Jenkins with Docker if it is not installed:

```bash
docker run -d -p 8080:8080 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```

**Login (GitHub, in the browser):**

1. Go to github.com -> **Sign in** (no account? click **Sign up** and verify your email).
2. Enter your username and password, then the 2FA code if you have it turned on.
3. You are logged in when you see your profile picture at the top right.

**Login (Jenkins, in the browser):**

1. Open `http://localhost:8080`.
2. First time only: it asks for the Administrator password. Get it with `sudo cat /var/lib/jenkins/secrets/initialAdminPassword` (or `docker logs <container-name>` if you started Jenkins with Docker). Paste it, choose **Install suggested plugins**, create your admin user, then Save and Finish.
3. Next times: log in with the username and password you created.

**Login (Gmail app password, for the email step):**

1. Sign in at myaccount.google.com.
2. Security -> turn on **2-Step Verification** (required for app passwords).
3. Search for **App passwords**, create one (name it `Jenkins`), and copy the 16-character password.
4. In Jenkins use your Gmail address and this app password as the credentials in Manage Jenkins -> System -> Extended E-mail Notification.

GitHub login is only needed to create the repo and upload the files; Jenkins clones a public repo without logging in.

**Extra setup (email):**

1. Manage Jenkins -> Plugins -> Available plugins -> install **Email Extension**.
2. Manage Jenkins -> System -> **Extended E-mail Notification**: SMTP server `smtp.gmail.com`, port `465`, tick Use SSL, and add credentials (your Gmail address and an app password).
3. In the script, replace `you@example.com` with the address that should receive the report.

**Repo files** (use your given project; a minimal sample):

`requirements.txt`:

```
pytest
```

`test_sample.py`:

```python
def test_add():
    assert 1 + 1 == 2
```

**Code** (paste in Pipeline script):

```groovy
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/<your-username>/<your-python-repo>.git'
            }
        }
        stage('Install') {
            steps {
                sh 'python3 -m venv venv'
                sh '. venv/bin/activate && pip install -r requirements.txt pytest'
            }
        }
        stage('Test & Report') {
            steps {
                sh '. venv/bin/activate && pytest --junitxml=report.xml || true'
            }
        }
    }
    post {
        always {
            junit 'report.xml'
            emailext(
                subject: "Build #${env.BUILD_NUMBER} - ${currentBuild.currentResult}",
                body: "Test report attached.\nBuild URL: ${env.BUILD_URL}",
                to: 'you@example.com',
                attachmentsPattern: 'report.xml'
            )
        }
    }
}
```

**How to run:**

1. Make sure Jenkins is running and open `http://localhost:8080` in the browser; log in.
2. On github.com click **+ -> New repository**, name it, set it to **Public**, click Create. Then **Add file -> Upload files**, upload the repo files listed above, and **Commit changes** on `main`.
3. In Jenkins click **New Item**, type a name, choose **Pipeline**, click OK.
4. Scroll down to the **Pipeline** section (keep Definition as "Pipeline script") and paste the code above into the box. Replace `<your-username>` and `<your-python-repo>` with your real GitHub username and repo name. If your branch is `master`, change `branch: 'main'` to `'master'`. Click **Save**.
5. Click **Build Now**. Under Build History click the build number, then **Console Output**. A green ball means success; a red ball means failure and the error is at the bottom of the console.
6. If the email step fails, re-check the SMTP and credentials settings from the email setup above.

**Check:** the build page shows the test results, and the recipient gets an email with `report.xml` attached. If the email step fails, re-check the SMTP settings.
