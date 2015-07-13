package com.asstar.app.common.util;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class SqlUtil {

	public static Predicate[] where(Root<?> root, CriteriaQuery<?> query,
			CriteriaBuilder cb, Object obj, Object... joins) {

		// 查询条件集合
		List<Predicate> predicates = new ArrayList<Predicate>();

		// 主表查询条件
		for (Field f : obj.getClass().getFields()) {
			f.setAccessible(true);
			try {
				if (f.get(obj) != null && !f.get(obj).equals("")
						&& !f.get(obj).equals("null")) {
					if (f.get(obj).getClass() != null) {

						if (ClassUtil.type(f.get(obj))) {

							Path<String> key = root.get(f.getName());

							if (ClassUtil.typeof(f.get(obj)).equals(
									String.class)) {
								predicates.add(cb.like(key, "%"
										+ f.get(obj).toString() + "%"));
							} else {
								predicates.add(cb.equal(key, f.get(obj)));
							}

						} else {
							// 多表关联遍历
							for (int i = 0; i < joins.length; i++) {
								if (f.get(obj).getClass().equals(joins[i])) {
									// 对应关联表
									try {
										getJoin(root, cb, predicates,
												f.get(obj), joins[i]);
									} catch (InstantiationException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
								}
							}
						}

					}
				}
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return predicates.toArray(new Predicate[predicates.size()]);
	}

	public static void getJoin(Root<?> root, CriteriaBuilder cb,
			List<Predicate> predicates, Object obj, Object join)
			throws IllegalArgumentException, IllegalAccessException,
			SecurityException, InstantiationException {

		String table = ((Class) join).newInstance().getClass().getSimpleName();
		table = table.replaceFirst(table.substring(0, 1), table.substring(0, 1)
				.toLowerCase());

		Join<?, ?> joinSQL = root.join(table, JoinType.LEFT);

		for (Field f : obj.getClass().getFields()) {
			f.setAccessible(true);

			if (f.get(obj) != null && !f.get(obj).equals("")
					&& !f.get(obj).equals("null")) {
				if (f.get(obj).getClass() != null) {

					if (ClassUtil.type(f.get(obj))) {
						if (ClassUtil.typeof(f.get(obj)).equals(String.class)) {
							predicates.add(cb.like(
									joinSQL.get(f.getName()).as(String.class),
									"%" + f.get(obj).toString() + "%"));
						} else {
							predicates.add(cb.equal(joinSQL.get(f.getName()),
									f.get(obj)));
						}

					}

				}
			}

		}
	}

	public static String[] whereNative(Object obj, Object[]... joins) {

		// 查询条件集合
		String predicates = "";
		String relevance = "";

		// 主表查询条件
		for (Field f : obj.getClass().getFields()) {
			f.setAccessible(true);
			try {
				if (f.get(obj) != null && !f.get(obj).equals("")
						&& !f.get(obj).equals("null")) {
					if (f.get(obj).getClass() != null) {

						if (ClassUtil.type(f.get(obj))) {

							String key = "master." + f.getName();
							if (!predicates.equals("")) {
								predicates += " and ";
							}
							if (ClassUtil.typeof(f.get(obj)).equals(
									String.class)) {
								predicates += (key + " like '%"
										+ f.get(obj).toString() + "%'");
							} else {
								predicates += (key + "=" + f.get(obj));
							}

						} else {
							// 多表关联遍历
							for (int i = 0; i < joins.length; i++) {
								if (f.get(obj).getClass().equals(joins[i][0])) {
									// 对应关联表
									try {
										String[] tps = getJoinNative(
												predicates, relevance,
												f.get(obj), joins[i]);
										predicates = tps[0];
										relevance = tps[1];
									} catch (InstantiationException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
								}
							}
						}

					}
				}
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		String[] w = { predicates, relevance };
		return w;
	}

	public static String[] getJoinNative(String predicates, String relevance,
			Object obj, Object[] join) throws IllegalArgumentException,
			IllegalAccessException, SecurityException, InstantiationException {

		String table = ((Class) join[0]).newInstance().getClass()
				.getSimpleName();
		table = table.replaceFirst(table.substring(0, 1), table.substring(0, 1)
				.toLowerCase());
		relevance += " left join " + (String) join[1] + " " + table + " on "
				+ table + ".id=master." + (String) join[2];

		for (Field f : obj.getClass().getFields()) {
			f.setAccessible(true);

			if (f.get(obj) != null && !f.get(obj).equals("")
					&& !f.get(obj).equals("null")) {
				if (f.get(obj).getClass() != null) {

					if (ClassUtil.type(f.get(obj))) {

						String key = table + "." + f.getName();
						if (!predicates.equals("")) {
							predicates += " and ";
						}
						if (ClassUtil.typeof(f.get(obj)).equals(String.class)) {
							predicates += (key + " like '%"
									+ f.get(obj).toString() + "%'");
						} else {
							predicates += (key + "=" + f.get(obj));
						}

					}

				}
			}

		}

		String[] w = { predicates, relevance };
		return w;
	}
}
