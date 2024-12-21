from typing import List, Any

from aw_core.config import load_config_toml


default_config = """
[aa-qt]
autostart_modules = ["aa-server", "aa-watcher-afk", "aa-watcher-window"]

[aa-qt-testing]
autostart_modules = ["aa-server", "aa-watcher-afk", "aa-watcher-window"]
""".strip()


class AwQtSettings:
    def __init__(self, testing: bool):
        """
        An instance of loaded settings, containing a list of modules to autostart.
        Constructor takes a `testing` boolean as an argument
        """
        config = load_config_toml("aa-qt", default_config)
        config_section: Any = config["aa-qt" if not testing else "aa-qt-testing"]

        self.autostart_modules: List[str] = config_section["autostart_modules"]
