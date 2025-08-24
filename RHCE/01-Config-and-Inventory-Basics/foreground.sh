show_banner() {
    clear
    printf '%s\n' \
    '╔═══════════════════════════════════════════════════════════════╗' \
    '║                    🔥 RHCE LAB SETUP 🔥                      ║' \
    '║                                                               ║' \
    '║    ██████╗ ██╗  ██╗ ██████╗███████╗                          ║' \
    '║    ██╔══██╗██║  ██║██╔════╝██╔════╝                          ║' \
    '║    ██████╔╝███████║██║     █████╗                            ║' \
    '║    ██╔══██╗██╔══██║██║     ██╔══╝                            ║' \
    '║    ██║  ██║██║  ██║╚██████╗███████╗                          ║' \
    '║    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝                          ║' \
    '║                                                               ║' \
    "║           📚 Definitely NOT Installing Scenario... $1         ║" \
    '╚═══════════════════════════════════════════════════════════════╝'
}

dots=("📚" "📚." "📚.." "📚...")
counter=0

while [ ! -f /tmp/finished ]; do
    show_banner "${dots[$((counter % 4))]}"
    counter=$((counter + 1))
    sleep 1
done

clear
echo "✅ SETUP COMPLETE! ✅"
echo "🎉 Your RHCE lab environment is ready!"
