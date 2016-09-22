FROM loganp/powershell
MAINTAINER Gabe Marshall <gabemarshall@me.com>
COPY script_to_compress.ps1 ./
COPY compress.ps1 ./
RUN chmod +x script_to_compress.ps1
CMD ["powershell", "./compress.ps1"]
