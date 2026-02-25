#!/bin/bash
total=$(sysctl -n hw.memsize)
pagesize=$(sysctl -n hw.pagesize)
vm_stat | awk -v t="$total" -v p="$pagesize" '
  /Pages active/                {a=int($(NF))}
  /Pages wired down/            {w=int($(NF))}
  /Pages occupied by compressor/ {c=int($(NF))}
  END {printf "%.0f%%", (a+w+c)*p/t*100}
'
