# jenkins-starter
## 설치
### macOS
> 설치: `brew install jenkins`  
> 서비스 등록: `brew services start jenkins`  
> 
> 초기 패스워드  
> ```bash
> cat /usr/local/var/log/jenkins/error.log
> 
> Please use the following password to proceed to installation:
> 
> 481c1e5295ef46eXXXXXXXXXXXXXXXXX
> :q!
> ```
>
> 접속: `http://127.0.0.1:8080`  
> `Install suggested plugins` 로 설치  
> 계정 생성 

## Maven build
### Plugin 설치
> 1.Dashboard 화면에서 좌측 메뉴 `Jenkins 관리` 클릭  
> 2.`플러그인 관리` 클릭  
> 3.`설치 가능` 탭 클릭 후 필터에 `Maven Integration` 입력    
> 4.`Maven Integration plugin` 옆에 install 체크 박스 체크 후 `install without restart` 클릭   

### Global Tool Configuration
> 1.Dashboard 화면에서 좌측 메뉴 `Jenkins 관리` 클릭  
> 2.`Global Tool Configuration` 클릭  
> 3.Maven 탭에서 `Add Maven` 버튼 클릭  
> 4.Name: Maven 3.8.6, `Install automatically` 체크, version 선택 후 `Save`

### 프로젝트 생성
> 1.Dashboard 화면에서 좌측 `새로운 Item` 클릭  
> 2.프로젝트 이름 작성 후 `Maven project` 클릭 후 `OK` 버튼 클릭  

## Gradle build
### Plugin 설치
> 1.Dashboard 화면에서 좌측 메뉴 `Jenkins 관리` 클릭  
> 2.`플러그인 관리` 클릭  
> 3.`설치 가능` 탭 클릭 후 필터에 `post build task` 입력     
> 4.`Post build task` 옆에 install 체크 박스 체크 후 `install without restart` 클릭  
> 5.`설치된 플러그인 목록` 탭 클릭 후 필터에 `gradle plugin` 입력    
> 6.`Gradle Plugin` 의 경우 Jenkins 초기 설정 시 `Install suggested plugins` 으로 설정했으면 자동 설치되어 있음.
> 없으면 설치  

### Global Tool Configuration
> 1.Dashboard 화면에서 좌측 메뉴 `Jenkins 관리` 클릭  
> 2.`Global Tool Configuration` 클릭  
> 3.Gradle 탭에서 `Add Gradle` 버튼 클릭  
> 4.Name: Gradle 7.5, `Install automatically` 체크, version 선택 후 `Save`

## SSH Deploy
### Plugin 설치 
> 1.Dashboard 화면에서 좌측 메뉴 `Jenkins 관리` 클릭    
> 2.`플러그인 관리` 클릭   
> 3.`설치 가능` 탭 클릭 후 필터에 `publish over ssh` 입력  
> 4.`Publish Over SSH Plugin` 옆에 install 체크 박스 체크 후 `install without restart` 클릭

### 서버 추가
> 1.Dashboard 화면에서 좌측 메뉴 `Jenkins 관리` 클릭  
> 2.시스템 설정(Configure System) 클릭  
> 3.맨 아래 SSH Servers 탭 이동 후 추가 버튼 클릭  
> 4.Name 에 적절한 이름, Hostname 에는 IP Address, Username 에는 계정 이름, Remote Directory 에는 사용할 기본 디렉터리(프로젝트에서 SSH 연결 시 해당 디렉터리로 바로 이동)  
> 5.저장 버튼 클릭  

## CodeCommit Trigger
### Plugin 설치
> 1.Dashboard 화면에서 좌측 메뉴 `Jenkins 관리` 클릭  
> 2.`플러그인 관리` 클릭  
> 3.`설치 가능` 탭 클릭 후 필터에 `aws codecommit` 입력
> 4.`AWS CodeCommit Trigger Plugin` 옆에 install 체크 박스 체크 후 `install without restart` 클릭  

## 프로젝트 생성
### Gradle 프로젝트 + Github + SSH Server Deploy
> 1.Dashboard 화면에서 좌측 `새로운 Item` 클릭     
> 2.프로젝트 이름 작성 후 `Freestyle project` 클릭 후 `OK` 버튼 클릭    
> 3.GitHub project 체크, Project url 입력  
> 4-1.소스 코드 관리 탭에서 Git 체크, Repositories 에서 Add Repository 버튼 클릭  
> 4-2.Repository URL 입력, Credentials 에서 +Add 버튼 클릭 후 아이디/비밀번호 입력  
> 5.Branches to build 에서 */dev 입력(나는 dev 브랜치를 Deploy 하기 때문에)  
> 6-1.Build Steps 탭에서 Add build step 버튼 클릭  
> 6-2.Use Gradle Wrapper 체크, Make gradlew executable 체크, Wrapper location 에 `.` 입력, Tasks 에 `bootJar` 입력
> 
> 7-1.빌드 후 조치 탭에서 빌드 후 조치 추가 버튼 클릭, `Send build artifacts over SSH` 선택  
> 7-2.SSH Server Name 에 `Dev Server` 입력(나는 Dev Server 에 배포할 것이기 때문에)  
> 7-3.Transfer Set 에 Source files 에 `build/libs/*` 입력, Remove prefix 에 `build/libs` 입력, Remote directory 에 `/external-api/mvc` 입력 
> 서버의 Deploy Directory 는 `/Users/jujin/external-api/mvc` 인데 `/Users/jujin`은 시스템 설정에서 Remote Directory 에 입력했기 때문에 
> 나머지 `/external-api/mvc`만 입력한다.  
> 
> 8.Exec command 에 다음 입력
> ```bash
> launchctl stop external-api.mvc
> launchctl start external-api.mvc
> ```
> 9.저장 버튼을 클릭해서 프로젝트 생

### macOS 서비스 등록
> 내가 사용하는 Dev 서버는 macOS 환경으로 Dev 서버에는 다음을 정의한다.  
> 1.LaunchAgents 디렉터리로 이동: `cd /Library/LaunchAgents`   
> 2.서비스 등록을 위한 plist 파일 생성: `sudo vi external-api.mvc.plist`
> ```xml
> <?xml version="1.0" encoding="UTF-8"?>
> <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
> <plist version="1.0">
>   <dict>
>     <key>KeepAlive</key>
>     <true />
>     <key>RunAtLoad</key>
>     <true/>
>     <key>Label</key>
>     <string>external-api.mvc</string>
>     <key>ProgramArguments</key>
>     <array>
>       <string>/usr/bin/nohup</string>
>       <string>java</string>
>       <string>-jar</string>
>       <string>-Dspring.profiles.active=dev</string>
>       <string>/Users/jujin/external-api/mvc/external-api-mvc-0.0.1-SNAPSHOT.jar</string>
>     </array>
>   </dict>
> </plist>
> ```
> 3.서비스 등록: `launchctl load /Library/LaunchAgents/external-api.mvc.plist`  

### 참조사이트
> [[Jenkins]Jenkins 원격서버 배포(Publish Over SSH 플러그인)](https://blog.naver.com/PostView.naver?blogId=hj_kim97&logNo=222468500674&parentCategoryNo=&categoryNo=42&viewDate=&isShowPopularPosts=false&from=postView)
> [launchctl 사용법: 맥OS에서 서비스 등록하기](https://www.44bits.io/ko/post/register-service-on-macos-by-using-launchctl)
