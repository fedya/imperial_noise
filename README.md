# imperial_noise
Remove noise from old Imperial Russian romances.

This script written for https://vk.com/club106607447 and helps to remove noise and all other odd stuff
from old Russian romances.

Before cleanup

![Alt text](/ambragin.mp3.png?raw=true "Before cleanup")

After cleanup

![Alt text](/ambragin.mp3_cleaned.png?raw=true "After cleanup")

Usage:

```bash
# ./purefy.sh /tmp/ambragin.mp3
# [make spectrogram for /tmp/ambragin.mp3]
# [get noise sample from /tmp/ambragin.mp3]
# [generate noise profile]
# [cleanup /tmp/ambragin.mp3]
# [cleanup all other noise]
# [wav to mp3 convertation, need installed lame codec]
```
