## Description
This is a simple shell script that generates a [smart playlist](https://www.navidrome.org/docs/usage/features/smart-playlists/) for Navidrome. The playlist contains albums released in the prior years on the day it's run, minus however many years specified (default 50). So if it's run on 1/1/2026 it'll contain albums released on 1/1/2026, 1/1/2025, 1/1/2024, 1/1/2023, going all the way back to 1/1/1976.

## How to install
Save `onthisday.sh` into a folder where you store shell scripts (such as ~/scripts/), cd into the folder, and run

```
chmod +x ./onthisday.sh
```

Review the script and make any necessary changes, such as:
* Change the OUTPUT_FILE on line 4 to reflect wherever your Navidrome picks up smart playlists (/mnt/media/navidrome/playlists/OnThisDay.nsp for example.)
* The script assumes your files use the originaldate tag as the primary date field reflecting when albums were originally released. If you use a different tag, like date or releasedate, make sure you change lines 35 and 42 to reflect that.
* If you want to change the number of years output, change "50" on lines 18 and 26 to whatever you desire.

If you want it to run automatically every morning, set up your cron with something like:

```
0 3 * * * ~/scripts/onthisday.sh > /dev/null 2>&1
```

Making sure the filepath is correct. This will run the script every morning at 3.