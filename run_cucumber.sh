if [ $# = 2 ] ; then
cucumber features/${1}/features -r features/${1}/step_definitions/ -t ${2};
else
cucumber features/${1}/features -r features/${1}/step_definitions/;
fi