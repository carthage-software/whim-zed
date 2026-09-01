//! Whim language support for Zed.

use zed_extension_api as zed;

const WHIM_BINARY: &str = "whim";

struct WhimLanguageServerExtension;

impl zed::Extension for WhimLanguageServerExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> zed::Result<zed::Command> {
        let command = worktree
            .which(WHIM_BINARY)
            .ok_or_else(|| "`whim` is not available on PATH".to_owned())?;

        Ok(zed::Command {
            command,
            args: vec!["language-server".to_owned()],
            env: Vec::new(),
        })
    }
}

zed::register_extension!(WhimLanguageServerExtension);
