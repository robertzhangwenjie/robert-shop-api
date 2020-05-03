###
 # @Author: robert zhang
 # @Date: 2020-05-03 11:12:30
 # @LastEditTime: 2020-05-03 11:16:08
 # @LastEditors: robert zhang
 # @Description: docker构建
 # @
 ###
# 安装依赖
npm install

# 获取当前commitId
commitId=`git rev-parse --short HEAD`

# 定义应用名称，会将其渲染到k8s模板中
appName="robert-shop-api"

# 获取镜像名称，镜像名称根据自身情况进行修改
imageName="zhangwenjie/${appName}:${commitId}"

# 构建镜像
docker build -t ${imageName} .

# 推送镜像到仓库,用户名和密码需要自己设置
docker login -u ${REGISTRY_USERNAME} -p ${REGISTRY_PASSWORD}
docker push ${imageName}

# 将应用名称和配置名称写入到k8s配置文件，以便k8s部署时可以直接获取
echo "应用名称和镜像名称:"
printf "appName=${appName}\nimageName=${imageName}\n" | tee k8s/k8s.conf
