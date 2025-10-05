# Log Archive Tool

A simple Bash script to archive Linux log files and manage old archives.

## Features

* Archive logs from a specified directory
* Archives stored in `archives/` folder with timestamped filenames
* Keeps only the latest 5 archives (auto-cleanup)
* Lightweight and easy to use

## Usage

Clone the repository:

```bash
git clone git@github.com:mehmoodhaq7/log-archive-tool.git
cd log-archive-tool
chmod +x archive-logs.sh
./archive-logs.sh <log-directory>
```

Example:

```bash
./archive-logs.sh /var/log
```
https://roadmap.sh/projects/log-archive-tool
