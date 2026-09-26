{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Kleyen";
        email = "Kleyen@users.noreply.github.com";
      };
    };
    includes = [
      {
        condition = "gitdir:~/Projects/Work/";
        contents = {
          user.name = "GapayanD";
          user.email = "GapayanD@users.noreply.github.com";
        };
      }
    ];
  };
}
