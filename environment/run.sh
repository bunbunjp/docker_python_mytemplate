# /bin/bash -ex

###########
# 開発環境の構築および再構築を行います
###########

SCRIPT_PATH=`dirname $0`
CMD=`basename $0 .sh`
BASEDIR=`cd ${SCRIPT_PATH}/.. && pwd`
USERID=`id -u`
USERNAME=`whoami`
ENV_PATH=`dirname $0`
PROJECT_NAME=`pwd |xargs basename`

ARG="--build-arg USERID=${USERID}"
ARG="${ARG} --build-arg USERNAME=${USERNAME}"
ARG="${ARG} --build-arg PROJECT_NAME=${PROJECT_NAME}"
ARG="${ARG} --build-arg REQUIREMENTS=${REQUIREMENTS}"

VOLUMES=("app" "var")
VOLUME_OPT=""
PROJECT_DIR=/home/${USERNAME}/${PROJECT_NAME}

usage() {
    echo "Usage: "
    echo "  This script is ~."
    echo
    echo "Options:"
    echo "  --build"
    echo
    exit 1
}


for OPT in "$@"
do
    case $OPT in
        '-h'|'--help' )
            usage
            exit 1
            ;;
        '--build' )
            BUILD_MODE=1
            ;;
    esac
    shift
done

if [ "$BUILD_MODE" ]; then
    # Dockerfileに基づいてdocker build
    docker build --force-rm -t ${PROJECT_NAME} ${ENV_PATH} ${ARG}
fi

for D in ${VOLUMES[@]}
do
    VOLUME_OPT="${VOLUME_OPT} -v ${BASEDIR}/${D}:${PROJECT_DIR}/${D}"
done

docker run -it -i -p 8000:8000 ${VOLUME_OPT} ${PROJECT_NAME} python ${PROJECT_NAME}/app/manage.py runserver 0.0.0.0:8000
