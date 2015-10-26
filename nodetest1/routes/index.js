
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('index', { title: 'Muse', imgref: '/images/cat1.jpg' })
};