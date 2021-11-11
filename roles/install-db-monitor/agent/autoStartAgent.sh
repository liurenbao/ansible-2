#!/bin/bash

PrintUsage()
{
   echo "Usage: $0 [monitor] [directory_of_agent_jar_file] [agent_service_url]"
   echo "Example: $0 "
   echo "Example: $0 monitor /home/omm/devtest/monitor-agent http://127.0.0.1:9998/monitor-client-agent/metrics"
   exit   
}

UpdateGaussAgent()
{
   if [ $GaussMonitorAgentID ];then   
      echo "[info]The GaussMonitorAgent process id is:$GaussMonitorAgentID,killing..."  
      kill -9 $GaussMonitorAgentID 
      sleep 3
   fi

   echo "[info]Try to restart the GaussMonitorAgent...."  
   cd $GaussMonitorAgent_HOME
   nohup java -jar hisi-uoamp-monitor-agent-1.0-SNAPSHOT.jar >/dev/null 2>&1 &
}

##
CheckGaussMonitorState()  
{  
   echo "[info]Begin to check GaussMonitorAgent...[$(date +'%F %H:%M:%S')]"  
   if [ $GaussMonitorAgentID ];then   
      echo "[info]The GaussMonitorAgent process id is:$GaussMonitorAgentID,checking..."  
      # check if the http status code is 200  
      AgentServiceCode=$(curl -s -o $GaussMonitorAgent_HOME/checkState.info -m 10 $GaussMonitorAgent_URL -w %{http_code})  
      if [ $AgentServiceCode -eq 200 ];then  
         echo "[info]The http status code is $AgentServiceCode,GaussMonitorAgent is started successfully......"  
      else  
         echo "[error]GaussMonitorAgent start failed ,the http status code is $AgentServiceCode"  
         echo "[error]Try to restart the GaussMonitorAgent...."  
         kill -9 $GaussMonitorAgentID 
         sleep 3

         cd $GaussMonitorAgent_HOME
         nohup java -jar hisi-uoamp-monitor-agent-1.0-SNAPSHOT.jar >/dev/null 2>&1 & 
      fi  
   else
      echo "[info]Starting GaussMonitorAgent, please wait......"

      cd $GaussMonitorAgent_HOME
      nohup java -jar hisi-uoamp-monitor-agent-1.0-SNAPSHOT.jar >/dev/null 2>&1 &
   fi  
   echo "------------------------------"
 }  


if [ $# -ne 0 -a $# -ne 3 ];then
   PrintUsage
fi

GaussMonitorAgentID=$(ps -ef |grep -w 'hisi-uoamp-monitor-agent-1.0-SNAPSHOT.jar'|grep -v 'grep'|awk '{print $2}')

if [ $# == 0 ];then
   
   # Set Agent install directory as curent directory
   GaussMonitorAgent_HOME=`pwd`
   #GaussMonitorAgent_URL=http://127.0.0.1:9998/monitor-client-agent/metrics
   UpdateGaussAgent
   exit
fi

if [ $# == 3 ];then
   # Set Agent install directory and agent service metrics
   GaussMonitorAgent_HOME=$2
   #GaussMonitorAgent_URL=http://127.0.0.1:9998/monitor-client-agent/metrics
   GaussMonitorAgent_URL=$3
   CheckGaussMonitorState
   exit
fi

