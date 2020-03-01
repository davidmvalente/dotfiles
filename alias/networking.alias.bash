# Networking and security alias

public_processes () {
    ps -f $(sudo netstat -ltp | awk '{print $7}' | sed -e 's/\/.*//' | tail -n +3)
}
