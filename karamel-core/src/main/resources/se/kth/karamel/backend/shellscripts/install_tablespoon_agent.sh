echo $$ > %pid_file%; echo '#!/bin/bash
%sudo_command% mkdir /usr/local/tablespoon-agent
%sudo_command% wget -O /usr/local/tablespoon-agent/tablespoon-agent.jar "https://www.dropbox.com/s/klmxlg10pme3f1q/tablespoon-agent.jar"
%sudo_command% wget -O /etc/init.d/tablespoon-agent "https://www.dropbox.com/s/xunhnu04lvmaxab/tablespoon-agent"
%sudo_command% chmod +x /etc/init.d/tablespoon-agent
echo '%task_id%' >> %succeedtasks_filepath%
' > agent-install.sh ; chmod +x agent-install.sh ; ./agent-install.sh