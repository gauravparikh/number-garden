// the whole script must parse
const fs=require('fs'),path=require('path');const s=fs.readFileSync(path.resolve(__dirname,'..','index.html'),'utf8');
try{new Function(s.slice(s.indexOf('<script>')+8,s.lastIndexOf('</script>')));console.log('syntax: ok')}catch(e){console.log('syntax: FAIL',e.message);process.exitCode=1}
