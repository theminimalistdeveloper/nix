{ ... }: {
  programs.wofi = {
      enable = true;
      settings = {
        allow-images = true;
      };
      style = '' 
         * {
         opacity: 50%;
        }

        #window {
          background: transparent;
          box-shadow: 10px black;
        }

        #outer-box {
          background: #000;
          padding: 5px;
          border-radius: 5px;
        }

        #text {
          color: #f0f0f0;
          margin-left: 10px;
        }

        #inner-box {}

        #input {
          margin-bottom: 5px;
          border: none;
          background: #333;
          color: #fff;
        }
        #input:active {
          border-color: #fff;
        }

        #entry:selected {
          background: #ccc;
          color: #000;
        }
        #entry:selected #text {
          color: #000;
        }
      '';
    };
}
