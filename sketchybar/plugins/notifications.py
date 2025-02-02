import subprocess
import json

applescript_code = """
tell application "System Events"
    set appList to (every process whose visible is true)
    set badgeList to {}

    repeat with appProc in appList
        set appName to name of appProc
        try
            tell application "System Events" to tell dock preferences to tell list 1
                set badgeValue to (badge of UI element appName) as text
                if badgeValue is not missing value then
                    set end of badgeList to {appName, badgeValue}
                end if
            end tell
        on error
            -- Skip apps without a badge
        end try
    end repeat
end tell

return badgeList
"""

def get_notification_badges():
    """Runs the AppleScript and returns the output as a Python dictionary"""
    process = subprocess.run(
        ["osascript", "-e", applescript_code],
        capture_output=True,
        text=True
    )
    
    output = process.stdout.strip()
    
    try:
        # Convert AppleScript list format to JSON
        print(output)
        badge_dict = json.loads(output.replace("missing value", "null"))
        return badge_dict
    except json.JSONDecodeError:
        return {"error": "Failed to parse AppleScript output"}

# Example usage
if __name__ == "__main__":
    badges = get_notification_badges()
    print(badges)
