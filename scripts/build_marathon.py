#!/usr/bin/env python

import os
import sys
import json

if len(sys.argv) != 4:
    sys.stderr.write(
        "{}: invalid number of arguments\n".format(os.path.basename(__file__)))
    sys.exit(1)

for file in sys.argv[1:2]:
    not_found_files = []
    if not os.path.isfile(file):
        not_found_files.append(file)
    if len(not_found_files) > 0:
        for not_found_file in not_found_files:
            sys.stderr.write("{}: file not found: {}\n".format(os.path.basename(__file__), not_found_file))
        sys.exit(1)

resource_file_path = sys.argv[1]
marathon_tpl_file_path = sys.argv[2]
marathon_file_path = sys.argv[3]
warning = "{{! Do not edit. Generated from marathon.json.mustache.tpl }}\n"
fetch_placeholder = '"{{FETCH}}"'
resource_urls_placeholder = '"{{RIAK_MESOS_RESOURCE_URLS}}"'


def read_file(file_path):
    with open(file_path, 'r') as file_content:
        content = file_content.read()
    return content


def write_file(file_path, content):
    with open(file_path, 'w') as file:
        file.write(content)


def get_resource_uris(file_path):
    resource = json.load(open(file_path))
    return resource['assets']['uris']


def create_marathon_fetch(res_uris):
    uris = []
    for resource in res_uris:
        fetch = {'extract': False}
        if resource == 'scheduler':
            fetch['extract'] = True
        fetch['uri'] = '{{resource.assets.uris.' + resource + '}}'
        uris.append(fetch)
    return json.dumps(uris)


def create_marathon_resource_urls(res_uris):
    urls = '"{'
    for resource in res_uris:
        resource_uri = '{{resource.assets.uris.' + resource + '}}'
        urls += '\\"' + resource + '\\": \\"' + resource_uri + '\\",'
    return urls[:-1] + '}"'


resource_uris = get_resource_uris(resource_file_path)
marathon_tpl_content = read_file(marathon_tpl_file_path)
marathon_fetch = create_marathon_fetch(resource_uris)
marathon_resource_urls = create_marathon_resource_urls(resource_uris)
marathon_tpl_content = marathon_tpl_content.replace(fetch_placeholder,
                                                    marathon_fetch)
marathon_tpl_content = marathon_tpl_content.replace(resource_urls_placeholder,
                                                    marathon_resource_urls)
marathon_tpl_content = warning + marathon_tpl_content
write_file(marathon_file_path, marathon_tpl_content)
