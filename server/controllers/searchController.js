const File = require('../models/File')

class SearchController {
    async search (req, res) {
        try {
            const { search } = req.body
            // const { search } = req.body.query
            search.replace('"', '')
            console.log(search, 'hhhhhhhh')

            // const serachResult = await File.find({name: search})
            const serachResult = await File.find({"name" : {$regex : search}});

            return res.status(200).json({status: 'success', data: serachResult})

        } catch (error) {
            res.status(400).json({error})
        }
    }
}

module.exports = new SearchController()