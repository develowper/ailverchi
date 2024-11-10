import {sql} from '~~/server/db';

export type UserModel = {
    id: number,
    fullname: string,
    phone: string,
    created_at: string
}

export const read = async () => {
    const result = await sql({
        query: 'SELECT * FROM users',
    })
    console.log('sql', result);
    return result as UserModel;
}
export const create = async (data: Pick<UserModel, 'fullname' | 'phone'>) => {
    const result = await sql({
        query: `
            INSERT INTO users(fullname,
                              phone)
            VALUES (?,
                    ?)RETURNING *
        `,
        values: [data.fullname, data.phone]
    }) as any;
    return result.length === 1 ? (result[0] as UserModel) : null
}

export const detail = async (id: string) => {
    const result = (await sql({
        query: 'SELECT * FROM users WHERE id = ?',
        values: [id]
    })) as any;
    return result.length === 1 ? (result[0] as UserModel) : null;
}

export const update = async (id: string, data: Pick<UserModel, 'fullname' | 'phone'>) => {
    const result = await sql({
        query: `
            UPDATE users
            SET name  = ?,
                phone = ?,
                WHERE id = ?
        `,
        values: [data.fullname, data.phone, id]
    }) as any;
    return await detail(id);
}

export const remove = async (id: string) => {
    return await sql({
        query: 'DELETE FROM users WHERE id=?',
        values: [id]
    });
}
