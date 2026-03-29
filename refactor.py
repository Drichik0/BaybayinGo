import os
import re

lib_dir = "lib"

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    original_content = content
    modified = False

    # 1. Wrap SingleChildScrollView
    start_str = "body: SingleChildScrollView("
    idx = content.find(start_str)
    if idx != -1 and 'body: Center(child: ConstrainedBox' not in content:
        start_paren = idx + len("body: SingleChildScrollView")
        
        paren_count = 0
        end_idx = -1
        for i in range(start_paren, len(content)):
            if content[i] == '(':
                paren_count += 1
            elif content[i] == ')':
                paren_count -= 1
                if paren_count == 0:
                    end_idx = i
                    break
        
        if end_idx != -1:
            prefix = content[:idx]
            wrapper_start = 'body: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 600), child: SingleChildScrollView('
            inner = content[start_paren+1:end_idx]
            wrapper_end = ')))'
            suffix = content[end_idx+1:]
            
            content = prefix + wrapper_start + inner + wrapper_end + suffix
            modified = True

    # 2. Heuristically remove the Back button at the bottom of the column
    # The back button usually consists of `SizedBox(... child: ElevatedButton( ... "Back" ... ))`
    # Let's search for "Back" and step backward to find the wrapping SizedBox.
    while True:
        # Find occurrences of Text("Back") or Text('Back')
        back_match = re.search(r'Text\(\s*["\']Back["\']', content)
        if not back_match:
            break
            
        # If found, trace backward to find the 'SizedBox(' that wraps it.
        # It's usually a few lines above.
        search_area = content[:back_match.start()]
        sizedbox_idx = search_area.rfind('SizedBox(')
        
        if sizedbox_idx == -1:
            break # Shouldn't happen if it's there
            
        # Is it preceded by `// Back Button`?
        comment_idx = search_area.rfind('// Back Button', max(0, sizedbox_idx - 50), sizedbox_idx)
        start_remove_idx = comment_idx if comment_idx != -1 else sizedbox_idx
        
        # Now trace forward to find the matching closing bracket for SizedBox(
        paren_count = 0
        end_remove_idx = -1
        started = False
        for i in range(sizedbox_idx, len(content)):
            if content[i] == '(':
                paren_count += 1
                started = True
            elif content[i] == ')':
                paren_count -= 1
                if started and paren_count == 0:
                    end_remove_idx = i
                    break
                    
        if end_remove_idx != -1:
            # check if there's a comma after the sizedbox
            if end_remove_idx + 1 < len(content) and content[end_remove_idx + 1] == ',':
                end_remove_idx += 1
                
            # Remove the whole block including leading whitespace
            # find start of line for start_remove_idx
            line_start = content.rfind('\n', 0, start_remove_idx)
            if line_start != -1:
                start_remove_idx = line_start + 1
                
            content = content[:start_remove_idx] + content[end_remove_idx+1:]
            # We might leave an empty line, but that's fine
            modified = True
        else:
            break # Failed to parse

    if modified:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Modified: {filepath}")

for root, _, files in os.walk(lib_dir):
    for file in files:
        if file.endswith('.dart'):
            process_file(os.path.join(root, file))
