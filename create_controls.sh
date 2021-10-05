  #!/bin/bash   

rm controls_homeconnect.txt

git ls-files -z | while IFS= read -r -d '' f; 
  do
    if [[ $f != *.git* && $f == *48_HomeConnect*.pm ]]; then
      out="$(date -d "@$( stat -c '%Y' $f )" +'%F_%T') $(stat -c%s $f) ${f}"      
      echo UPD ${out//.\//} >> controls_homeconnect.txt
    fi 
  done
