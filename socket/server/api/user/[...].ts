import {useBase, createRouter, defineEventHandler} from 'h3';
import * as userController from '~~/server/controller/blogController';

const router = createRouter();

router.get('/search', defineEventHandler(userController.read));
router.post('', defineEventHandler(userController.create));
router.get(':id', defineEventHandler(userController.detail));
router.put(':id', defineEventHandler(userController.update));
router.delete(':id', defineEventHandler(userController.remove));

export default useBase('/api/user', router.handler);
