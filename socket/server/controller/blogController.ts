import {H3Event} from "h3";
import * as  UserModel from "~/server/model/blog";

const config = useRuntimeConfig();
export const read = async () => {
    try {
        const result = await UserModel.read();
        return {
            data: result
        };
    } catch (e) {
        throw createError({
            statusCode: 401,
            statusMessage: `${e}`,

        })
    }
}

export const create = async (evt: H3Event) => {
    try {
        const body = await readBody(evt);
        const result = await UserModel.create({
            fullname: body.fullname,
            phone: body.phone,
        });
        return {
            data: result
        };
    } catch {
        throw createError({
            statusCode: 401,
            statusMessage: 'Error!'

        })
    }
}

export const detail = async (evt: H3Event) => {
    try {
        const result = await UserModel.detail(evt.context.params?.id as string);
        return {
            data: result
        };
    } catch {
        throw createError({
            statusCode: 401,
            statusMessage: 'Error!'

        })
    }
}
export const update = async (evt: H3Event) => {
    try {
        const body = await readBody(evt);
        const result = await UserModel.update(evt.context.params?.id as string, {
            fullname: body.fullname,
            phone: body.phone,
        });
        return {
            data: result
        };
    } catch {
        throw createError({
            statusCode: 401,
            statusMessage: 'Error!'

        })
    }
}

export const remove = async (evt: H3Event) => {
    try {
        const result = await UserModel.remove(evt.context.params?.id as string);
        return {
            data: result
        };
    } catch {
        throw createError({
            statusCode: 401,
            statusMessage: 'Error!'

        })
    }
}
