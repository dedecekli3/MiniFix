#!/bin/bash

echo "🔧 MiniFix: Emergency System Repair Tool (Linux version)"
LOGFILE="/tmp/minifix.log"

echo "📁 Hledám Windows oddíly..." | tee -a $LOGFILE
WINDOWS_PART=$(lsblk -o NAME,FSTYPE | grep ntfs | awk '{print $1}' | head -n 1)
MOUNTPOINT="/mnt/windows"

if [ -z "$WINDOWS_PART" ]; then
  echo "❌ NTFS oddíl nenalezen. Zkus připojit disk ručně." | tee -a $LOGFILE
  exit 1
fi

DEVICE="/dev/$WINDOWS_PART"
echo "✅ Našel jsem: $DEVICE" | tee -a $LOGFILE

echo "📦 Připojuju oddíl..." | tee -a $LOGFILE
mkdir -p $MOUNTPOINT
mount $DEVICE $MOUNTPOINT 2>> $LOGFILE

if [ $? -ne 0 ]; then
  echo "❌ Nepodařilo se připojit $DEVICE" | tee -a $LOGFILE
  exit 1
fi

echo "🔍 Kontrola NTFS systému..." | tee -a $LOGFILE
ntfsfix $DEVICE | tee -a $LOGFILE

echo "🧠 Hledám registry..." | tee -a $LOGFILE
REGISTRY_PATH="$MOUNTPOINT/Windows/System32/config"

if [ -d "$REGISTRY_PATH" ]; then
  echo "🔒 Registry nalezeny. Zálohuju..." | tee -a $LOGFILE
  mkdir -p $REGISTRY_PATH/backup
  cp $REGISTRY_PATH/SYSTEM $REGISTRY_PATH/backup/SYSTEM.bak 2>> $LOGFILE
  cp $REGISTRY_PATH/SOFTWARE $REGISTRY_PATH/backup/SOFTWARE.bak 2>> $LOGFILE
else
  echo "⚠️ Složka registrů nebyla nalezena!" | tee -a $LOGFILE
fi

echo "🧹 Čistím Temp složku..." | tee -a $LOGFILE
rm -rf $MOUNTPOINT/Windows/Temp/* 2>> $LOGFILE

echo "📋 Hotovo. Log uložen v $LOGFILE"
echo "📦 Nezapomeň odpojit disk: umount $MOUNTPOINT"
