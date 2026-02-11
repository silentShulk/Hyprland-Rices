function reshade --wraps='curl -LO https://github.com/kevinlekiller/reshade-steam-proton/raw/main/reshade-linux.sh && chmod +x reshade-linux.sh && ./reshade-linux.sh && rm reshade-linux.sh' --description 'alias reshade=curl -LO https://github.com/kevinlekiller/reshade-steam-proton/raw/main/reshade-linux.sh && chmod +x reshade-linux.sh && ./reshade-linux.sh && rm reshade-linux.sh'
    curl -LO https://github.com/kevinlekiller/reshade-steam-proton/raw/main/reshade-linux.sh && chmod +x reshade-linux.sh && ./reshade-linux.sh && rm reshade-linux.sh $argv
end
