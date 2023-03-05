

class newChatController {
    async sendMessage (req, res) {
        try {
            
        } catch (error) {
            res.status(400).json({error})
        }
    }
}

module.exports = new newChatController()