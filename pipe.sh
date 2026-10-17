#!bin/bash

echo "---pipe demo---"
ls -l | wc -l
ps aux | grep bash | head -3
cat /etc/passwd | cut -d: -f1 |sort | head -5
echo "--Date demo--"
echo "C date:$(date)"
sudo date -s "2026-12-25 10:30:00"
echo "new date:$(date)"
