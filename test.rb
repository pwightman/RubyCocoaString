require"open-uri";open("https://t.co/OaiGnwil").each{|l|l.sub("# ","").each_char{|c|print c.sub("\n","\r#{" "*80}\r");sleep 0.1};sleep 0.1}
