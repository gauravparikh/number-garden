#!/bin/sh
# lists the Tell Pip reports, newest first. Needs curl and python3; no secrets involved (the web key is public, the rules allow reading reports)
curl -s "https://firestore.googleapis.com/v1/projects/playmaths-6a181/databases/(default)/documents/reports?key=AIzaSyCgG83-cqWqDuzOWrIQwqLBMF7sTwOkbWA&pageSize=100" | python3 -c '
import sys,json
d=json.load(sys.stdin);docs=d.get("documents",[])
rows=[]
for doc in docs:
    f=doc["fields"];g=lambda k:f.get(k,{}).get("stringValue",f.get(k,{}).get("integerValue",""))
    rows.append((g("when"),g("label"),g("game"),g("level"),g("prompt"),g("stage")[:80],g("ver"),g("family"),g("device")))
rows.sort(reverse=True)
print(len(rows),"reports")
for r in rows: print(" | ".join(str(x) for x in r))
'
