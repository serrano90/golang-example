#dep install
dep ensure -v
#generate binary
env GOOS=linux go build -ldflags="-s -w" -o bin/hello hello/main.go
env GOOS=linux go build -ldflags="-s -w" -o bin/world world/main.go
#zip lambda
#~/Go/Bin/build-lambda-zip.exe -o main.zip main
cd bin
~/Go/Bin/win-go-zipper.exe -o serverless-test.zip ./
#deploy serverless
cd ..
sls deploy --aws-profile deployDev