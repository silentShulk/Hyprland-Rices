function updategrub --wraps='sudo grub-mkconfig -o /boot/grub/grub.cfg' --description 'alias updategrub=sudo grub-mkconfig -o /boot/grub/grub.cfg'
    sudo grub-mkconfig -o /boot/grub/grub.cfg $argv
end
