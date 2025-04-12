#!/bin/bash

echo "===== CPU STATUS REPORT ====="
echo ""

# CPU Load Average (1, 5, and 15 minutes)
echo "📊 Load Average:"
uptime | awk -F'load average:' '{ print $2 }'
echo ""

# CPU Usage (User/System/Idle)
echo "🔧 CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
awk '{print "User: " $2 "%, System: " $4 "%, Idle: " $8 "%"}'
echo ""

# Number of Cores
echo "🧠 CPU Cores:"
nproc
echo ""

# CPU Info (Model Name)
echo "💻 CPU Model:"
grep -m 1 "model name" /proc/cpuinfo | cut -d: -f2
echo ""

# CPU Temperature (if available)
if command -v sensors &> /dev/null; then
  echo "🌡️ CPU Temperature:"
  sensors | grep -i 'temp1'
else
  echo "🌡️ CPU Temperature: 'sensors' command not found. Install with 'sudo yum install lm_sensors' or 'sudo apt install lm-sensors'"
fi

echo ""
echo "=============================="